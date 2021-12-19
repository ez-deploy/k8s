# Kratos

`Kratos`是一个开箱即用的权限服务系统，本部分用于构建一个专属的`kratos`镜像。

`Kratos`的运行需要基于：
- `kratos.yml`、`identity.schema.json`两个配置文件；
- `mysql`数据库的DSN；

来运行。基础的配置文件已经给出，需要由用户自行填充`dsn`部分，需要给出环境变量：
 - `MYSQL_USER`:  用户名；
 - `MYSQL_PASSWORD`: 密码；
 - `MYSQL_HOST`: 域名/IP；

除此之外，运行`kratos serve -c /path/to/config`前需要先对数据库进行初始化，因此将初始化与运行逻辑整合在`run-kratos.sh`中。
