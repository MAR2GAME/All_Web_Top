# All Web Top

This repository keeps the source copies for two static app landing pages.

## Sites

- [File_Recovery_top](./File_Recovery_top) - File Recovery static landing page
- [LocShare_top](./LocShare_top) - LocShare: GPS Locator static landing page

## Standalone Repositories

Each site has also been published as its own GitHub repository so it can use an independent GitHub Pages custom domain and serve `app-ads.txt` from the domain root.

- [MAR2GAME/File_Recovery_top](https://github.com/MAR2GAME/File_Recovery_top)
- [MAR2GAME/LocShare_top](https://github.com/MAR2GAME/LocShare_top)

## App Ads

Both sites include an `app-ads.txt` file with this content:

```text
google.com, pub-3615322193850391, DIRECT, f08c47fec0942fa0
```

When deploying each site as a standalone web root, the expected URL is:

```text
https://your-domain.example/app-ads.txt
```

## Deployment Note

For ad platform verification, deploy each site from its own repository or server root. Avoid hosting these pages under nested paths such as `/All_Web_Top/File_Recovery_top/`, because that prevents `app-ads.txt` from being available at the domain root.
