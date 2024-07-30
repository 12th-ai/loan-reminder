const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  pwa: {
    manifestOptions: {
      name: "Loan App",
      short_name: "Loan App",
      description: "Loan Reminder App",
      background_color: "#ffffff",
      start_url: ".",
      display: "standalone",
      theme_color: "#4a99cb",
      orientation: "portrait-primary",
      scope: ".",
      icons: [
        {
          src: "/img/icons/icon-72x72.png",
          sizes: "72x72",
          type: "image/png",
          // purpose: "maskable any"
        },
        {
          src: "/img/icons/icon-96x96.png",
          sizes: "96x96",
          type: "image/png",
          // purpose: "maskable any"
        },
        {
          src: "/img/icons/icon-128x128.png",
          sizes: "128x128",
          type: "image/png",
          // purpose: "maskable any"
        },
        {
          src: "/img/icons/icon-144x144.png",
          sizes: "144x144",
          type: "image/png",
          // purpose: "maskable any"
        },
        {
          src: "/img/icons/icon-152x152.png",
          sizes: "152x152",
          type: "image/png",
          // purpose: "maskable any"
        },
        {
          src: "/img/icons/icon-192x192.png",
          sizes: "192x192",
          type: "image/png",
          // purpose: "maskable any"
        },
        {
          src: "/img/icons/icon-284x284.png",
          sizes: "284x284",
          type: "image/png",
          // purpose: "maskable any"
        },
        {
          src: "/img/icons/icon-512x512.png",
          sizes: "512x512",
          type: "image/png",
          // purpose: "maskable any"
        }
      ],
    },

    themeColor: "#FFFFFF",
    msTileColor: "#000000",
    appleMobileWebAppCapable: "yes",
    appleMobileWebAppStatusBarStyle: "black",
    iconPaths: {
      maskicon: null,
      favicon32: "img/walletLogo.png",
      favicon16: "img/walletLogo.png",
      appleTouchIcon: null,
      msTileImage: null,
    },
    // configure the workbox plugin
    workboxPluginMode: "GenerateSW",
  }
})
