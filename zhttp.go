package myip

import (
	"io/ioutil"
	"net/http"
	"zabbix/pkg/plugin"
)

type Plugin struct {
	plugin.Base
}

var impl Plugin

func (p *Plugin) Export(key string, params []string, ctx plugin.ContextProvider) (result interface{}, err error) {

	resp, err := http.Get("https://api.ipify.org")
	if err != nil {
		panic(err)
	}

	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		panic(err)
	}
	return string(body), nil
}

func init() {
	plugin.RegisterMetrics(&impl, "Myip", "myip", "Perform query and returns my ip addrr.")
}
