## legado阅读3.0自动构建[![Android CI](https://github.com/10bits/gedoor-Build/workflows/Android%20CI/badge.svg)](https://github.com/10bits/gedoor-Build/actions)

> 默认从最新发布的tag构建,每次构建会自动清空18PlusList.txt

> 最新构建下载:[legado-3.21.100223.apk](https://github.com/EternalTimes/gedoor-Build/releases/download/legado-3.21.100223/legado-3.21.100223.apk) 上次构建时间:2021-10-03 02:09:13
<!--start-->
> **2021/10/02**
> 
> 1. 紧急修复弹出框崩溃bug
> 2. 修复字体变粗后不能变回的bug
> 3. 修复底部对齐有时无效的bug
> * 不要嫌更新得频繁,这是因为最近新加的功能比较多,出bug很正常,而且我是一个人写软件,没有测试人员,只有发出来大家一起找bug了,遇到bug及时反馈,能修复的我都会在第一时间修复
<!--end-->
  
1. fork到你自己的仓库
2. 去你自己的仓库,点一下右上角star就会自动开始构建,已经star的点unstar,再点一下star就会进行新的构建,你的[Actions](https://github.com/10bits/gedoor-Build/actions)列表会有显示的
3. 每次构建完,apk会自动打包为`legado.apk.zip
`,去你自己的[Actions](https://github.com/10bits/gedoor-Build/actions)列表里找
4. 每次构建大概十几分钟,请耐心等待

## 如果你安装apk遇到以下问题

1. `安装失败(-102)`问题,给release apk增加了签名,已解决
2. `与已安装应用签名不同`问题,请卸载重新安装,已解决
3. `与已安装程序共存`问题,通过修改`applicationIdSuffix='.releaseA'`,已解决,不用卸载重装了
> 使用app过程中遇到问题,请到这里解决[gedoor/legado](https://github.com/gedoor/legado/issues)

