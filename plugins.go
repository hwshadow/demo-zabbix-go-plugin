/*
** Zabbix
** Copyright (C) 2001-2019 Zabbix SIA
**
** This program is free software; you can redistribute it and/or modify
** it under the terms of the GNU General Public License as published by
** the Free Software Foundation; either version 2 of the License, or
** (at your option) any later version.
**
** This program is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
** GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License
** along with this program; if not, write to the Free Software
** Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
**/

package plugins

import (
	_ "zabbix/plugins/kernel"
	_ "zabbix/plugins/log"
	_ "zabbix/plugins/net/netif"
	_ "zabbix/plugins/proc"
	_ "zabbix/plugins/system/cpucollector"
	_ "zabbix/plugins/system/uname"
	_ "zabbix/plugins/system/uptime"
	_ "zabbix/plugins/systemd"
	_ "zabbix/plugins/systemrun"
	_ "zabbix/plugins/vfs/dev"
	_ "zabbix/plugins/vfs/file"
	_ "zabbix/plugins/zabbix/async"
	_ "zabbix/plugins/zabbix/stats"
	_ "zabbix/plugins/zabbix/sync"
	_ "zabbix/plugins/zhttp"
)
