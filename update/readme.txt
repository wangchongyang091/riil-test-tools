更新步骤：
1.停止RIIL_BMC和RIIL_CCS服务(更新包提供者根据文件性质酌情修改是否停止相关RIIL服务)
2.将升级包解压缩后的update文件夹拷贝到RIIL安装目录下（与RIIL目录同级）
  例如：
  D:\RuiJie
      ├─RIIL
      └─update
3.鼠标双击运行update.bat(切记只需双击一次)
4.查看update\logs\update.log,如果其中没有"fail",证明文件替换更新成功(请将该日志内容截图发给更新包提供者,更新包提供者根据日志内容决定是否需要执行还原动作(双击restore.bat))
5.重新启动服务(更新包提供者根据文件性质酌情修改是否启动相关RIIL服务)

注:
	需要替换的文件放在replace目录下,相关替换路径请查看config.properties里的注释
	双击运行update.bat后,会在当前目录下生成backup和logs目录,分别为备份文件目录和日志目录
    若想恢复为更新之前的状态,请双击运行restore.bat,查看update\logs\update.log内容,如没有"fail",证明还原成功