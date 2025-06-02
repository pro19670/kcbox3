'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "2fea8dc8732843e99151c8e76cc20990",
".git/config": "68ebb340e74aee467644b1a28642466a",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "31c063c8c811bcddd22279ee38916459",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "c04b7fcd8e0232b326a5b37484d1f4d5",
".git/logs/refs/heads/gh-pages": "c04b7fcd8e0232b326a5b37484d1f4d5",
".git/logs/refs/remotes/origin/gh-pages": "3f8b576cc408e8df2bd41e15c673da13",
".git/objects/05/21dfa87117d28b0da2793ee8ffa3f1e62ae8bf": "2a226c53d3c84c9cdc56fa36066b609d",
".git/objects/0d/54d8d5823798dd2f3085efc1cfcbf95fbb51a3": "3d79c6ad8a64cda5f67a098beb823a49",
".git/objects/17/bd3a58823bb432b5931e039a1c3d394f3bdc98": "258b6b2d00e179e4696893dfea374c47",
".git/objects/17/cea3159a22d26a48cb69624e4f520695211752": "09a55b68b11dff5c256c78e36b828f8e",
".git/objects/1a/d7683b343914430a62157ebf451b9b2aa95cac": "94fdc36a022769ae6a8c6c98e87b3452",
".git/objects/1f/3cc5c43434b33483257976a978a0c9601705d3": "7fa5311592fc32e7858777ae1844332f",
".git/objects/23/0c4dcef6bfceaac4e5a1a95e3017b910ec4831": "46886636f395746e7dc679dffa34fa98",
".git/objects/2c/aa8604cd14663f8de1506c9148fab4e70c437f": "b3377c5293b9191a4fda3053cd4aca11",
".git/objects/31/d31e803ac64727161fadc332313b4605e47bb6": "65ec92a5827f7ba4b26a85b3d0924d16",
".git/objects/3a/bf18c41c58c933308c244a875bf383856e103e": "30790d31a35e3622fd7b3849c9bf1894",
".git/objects/3c/b931fdff4dd3df51dc83f7734ad7f7250c0e1c": "07ae8f6a664c26e5a6d86bbd9e6c013f",
".git/objects/47/0dd25f2e9c8bcd5fed09b0582c5bd83292faf2": "cd85322a5df8551036f1e90ec04ea86c",
".git/objects/4c/3f74bfc47466aeca05c127097cf60b274ba7c7": "07f8d9acb83f2a2966a9620688c804b8",
".git/objects/4c/51fb2d35630595c50f37c2bf5e1ceaf14c1a1e": "a20985c22880b353a0e347c2c6382997",
".git/objects/51/d0b916b0bd40bb23e2f72b47b0def747e3ee6e": "69fde81f87b64e9de0abb2e99104c48e",
".git/objects/53/18a6956a86af56edbf5d2c8fdd654bcc943e88": "a686c83ba0910f09872b90fd86a98a8f",
".git/objects/53/3d2508cc1abb665366c7c8368963561d8c24e0": "4592c949830452e9c2bb87f305940304",
".git/objects/55/a56de477939dc166fe0c3a0497c2313d062db7": "983d68b41a7a726ff9cf865b761eed1e",
".git/objects/56/e4a554f001152d4235b0eef8aac7ec0d57c573": "e24a3b4c8b3f421c8247b8da55988bd1",
".git/objects/57/d9c2e36eda8c74d4c30890f45c2a7ef8e278ee": "7da44384171db468689e8b4e845d39b3",
".git/objects/6a/b0205673470117f73b7a0301cb79b48fb4eec5": "cf78205ba33235c14c73984777662908",
".git/objects/6d/0c5ed69ba2fa1fd0d706575794ed83bb1a4d0b": "e9dcf0d73c9d6e324dd7b0aa5b70b3d8",
".git/objects/70/a234a3df0f8c93b4c4742536b997bf04980585": "d95736cd43d2676a49e58b0ee61c1fb9",
".git/objects/73/c63bcf89a317ff882ba74ecb132b01c374a66f": "6ae390f0843274091d1e2838d9399c51",
".git/objects/75/fd3d28b60278400c5c6b9d41f7da63a2c3e452": "6c4e2ad10c03b61ca4fcc4a43141c830",
".git/objects/77/c40e16966e0bd7d47d6d5acd5da80452f64611": "28ef898ab22ae5c7c6f41c08a953dd6b",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8e/3c7d6bbbef6e7cefcdd4df877e7ed0ee4af46e": "025a3d8b84f839de674cd3567fdb7b1b",
".git/objects/98/181af306728700055c51b08c47afd40eab3baf": "0152a5650d46ce1f31f6e5a562d0ebf8",
".git/objects/9b/d3accc7e6a1485f4b1ddfbeeaae04e67e121d8": "784f8e1966649133f308f05f2d98214f",
".git/objects/9e/802b4365c50050f44950a0a98ed6d4cc59ce78": "60c0f809a0beb9077b226fdab5de7b9a",
".git/objects/ab/6a6d37a6c32e6a4cbb82a328cba44d2963383d": "e3ff6e94c280dc6eef11ddbfd5ea1d85",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/6a5236065a6c0fb7193cb2bb2f538b2d7b4788": "4227e5e94459652d40710ef438055fe5",
".git/objects/bf/52c766ef678981ce2a8e96c7db4f394bb5339c": "1262c5818fdc3bff0e83f4ce27d6c474",
".git/objects/c1/1b95b443426e0e83d1bdb9b0f08f9456201089": "c39c1e3cf070ff4121b8181602c643fb",
".git/objects/c6/b2357df0966d5d604bd34c7bae1ebf83c7a4ee": "497a89acb3602d1bfa43af60386c8355",
".git/objects/c8/08fb85f7e1f0bf2055866aed144791a1409207": "92cdd8b3553e66b1f3185e40eb77684e",
".git/objects/ce/de10a33aaa008a5eeb60be2208b48f8329e7c0": "ebcd25c0827ab384f4c287711edc2804",
".git/objects/d3/ed50aa1880b33352730f718b6b19f68e0ff2e3": "1b9258416c967d9fadbcfcb599201d4e",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/dc/11fdb45a686de35a7f8c24f3ac5f134761b8a9": "761c08dfe3c67fe7f31a98f6e2be3c9c",
".git/objects/e0/7ac7b837115a3d31ed52874a73bd277791e6bf": "74ebcb23eb10724ed101c9ff99cfa39f",
".git/objects/e1/5d0dcb6fd078ff091e10a29eec6dc15915b2b5": "511133f69b3f962cc42690b58201d972",
".git/objects/e3/9ca5d9b01cf8bc042044587cd6c62556c4dfe9": "16ea7bb070be8ff1027a1ad810bdb00d",
".git/objects/e3/b94ab80819cb72f5bfb7001edd49c32d89fe37": "cc0c49aa6fa69c7efa4c4865382790cf",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f6/8ad14848114f077fd37aee48fd6fd20a626e53": "881beb60fd7ef8a853e5094c9a649ade",
".git/objects/fb/ab0231d2a9508207f110ee0d7281c95497592d": "729ea459dc59c524a1da4433088a1248",
".git/refs/heads/gh-pages": "b23c53cd6fb29367267fcfb043411abe",
".git/refs/remotes/origin/gh-pages": "b23c53cd6fb29367267fcfb043411abe",
"assets/AssetManifest.bin": "70e195061609817a4352cbf9f89138ef",
"assets/AssetManifest.bin.json": "c021214bf1766be779ce82523c5a8923",
"assets/AssetManifest.json": "c1a5988b67ee07976ce8854ba62861ed",
"assets/assets/images/1748701917181.png": "b2143977185809e342b43fbe3b785443",
"assets/assets/images/closet.png": "aceb2d65ee5104d34977aa6c24c078b0",
"assets/assets/images/default_background.jpg": "ff06046489bd7248cdcf2b0348de1782",
"assets/assets/images/default_home.jpg": "b94e2f2bd2121357b706dbdf30e5c656",
"assets/assets/images/drawer.png": "c2412db463003994331a7a1c6bc4fc2e",
"assets/assets/images/home.png": "16f7cf2042280a7e79f4d6690a16f43d",
"assets/assets/images/home_bg.jpg": "3598d4db12c017fa8ccd09c04a7eadda",
"assets/assets/images/office.png": "9ba62e529afdfa3a2f35a0db364dba70",
"assets/assets/images/office_structure.png": "c590be104f4d5e86ae544469e0a89db5",
"assets/assets/images/room.png": "ec64121966aafdb1727747e2b10e6213",
"assets/assets/images/room_structure.png": "976ab800d33e7397495a0e9ec4fc445e",
"assets/assets/images/structure.png": "8a1d1ae826eb697da2ee01b4f93c4b30",
"assets/assets/images/structure_bg.png": "892bb99b0b2086441c70143dce17a13b",
"assets/assets/images/warehouse.png": "b94e2f2bd2121357b706dbdf30e5c656",
"assets/assets/images/warehouse_structure.png": "694b4a190c135dd19dfe94708edc4f65",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "b97f83fa30bf9151dac7c3ff9baf636b",
"assets/NOTICES": "cac03078664deb7bc7709279e1611478",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "da1af45e133189df1434600681989a83",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "6e35c7bcbeb1f45ddc52a6ae5d461ead",
"/": "6e35c7bcbeb1f45ddc52a6ae5d461ead",
"main.dart.js": "5837b8150c0d3d55a3dbcd93fae4f5f5",
"manifest.json": "fcc306712195687df7f34a71e685bb3d",
"version.json": "a80fb940d01041b8b11141b222c4e9c3"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
