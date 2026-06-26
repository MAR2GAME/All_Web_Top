# All Web Top

本仓库保存多个应用静态官网首页的源码副本。

## 站点

- [File_Recovery_top](./File_Recovery_top) - File Recovery 静态官网首页
- [LocShare_top](./LocShare_top) - LocShare: GPS Locator 静态官网首页
- [Recovery_Scan_Save_top](./Recovery_Scan_Save_top) - Recovery: Scan & Save 静态官网首页

## 独立仓库

已发布站点使用独立 GitHub 仓库或独立服务器根目录，确保每个域名都可以从域名根路径提供 `app-ads.txt`。

- [MAR2GAME/File_Recovery_top](https://github.com/MAR2GAME/File_Recovery_top)
- [MAR2GAME/LocShare_top](https://github.com/MAR2GAME/LocShare_top)

## App Ads

File Recovery 和 LocShare 的 `app-ads.txt` 内容如下：

```text
google.com, pub-3615322193850391, DIRECT, f08c47fec0942fa0
```

Recovery: Scan & Save 的 `app-ads.txt` 内容如下：

```text
google.com, pub-3106003114382927, DIRECT, f08c47fec0942fa0
```

每个站点作为独立 Web 根目录部署时，预期访问地址为：

```text
https://your-domain.example/app-ads.txt
```

## 部署说明

为了通过广告平台验证，每个站点应从独立仓库或服务器根目录部署。避免把这些页面部署在 `/All_Web_Top/File_Recovery_top/` 这类嵌套路径下，否则 `app-ads.txt` 无法通过域名根路径访问。
