(() => {
    //廣告
    const div = document.createElement('div');
    div.classList.add('d-none');

    // < !-- class row 播放 d - none 隱藏 -->
    div.id = "proBanner";
    div.innerHTML = `
    <div class="col-12">
        <span class="d-flex align-items-center purchase-popup">
        <p>Get tons of UI components, Plugins, multiple layouts, 20+ sample pages, and more!</p>
        <a href="https://www.bootstrapdash.com/product/celestial-admin-template/?utm_source=organic&utm_medium=banner&utm_campaign=free-preview"
            target="_blank" class="btn download-button purchase-button ml-auto">Upgrade To Pro</a>
        <i class="typcn typcn-delete-outline" id="bannerClose"></i>
        </span>
    </div>`;
    const nav = document.createElement('nav');
    nav.classList.add('navbar', 'col-lg-12', 'col-12', 'p-0', 'fixed-top', 'd-flex', 'flex-row');
    // <!-- partial:partials/_navbar.html -->
    let path = "http://";
    let hostname = window.location.host;
    let pathname = window.location.pathname.substring(0, window.location.pathname.indexOf('/', 2));
    nav.innerHTML = `
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
            <a class="navbar-brand brand-logo" href="`+ path + hostname + pathname + `/back-end/index_back.html"><img src="` + path + hostname + pathname + `/back-end/images/logo2.png" alt="logo"  style="height: auto;padding: 20px" /></a>
            <a class="navbar-brand brand-logo-mini" href="index.html"><img src="`+ path + hostname + pathname + `/back-end/images/logo2.png"
                alt="logo" /></a>
            <button class="navbar-toggler navbar-toggler align-self-center d-none d-lg-flex" type="button"
                data-toggle="minimize">
                <span class="typcn typcn-th-menu"></span>
            </button>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
            <ul class="navbar-nav mr-lg-2">
                <li class="nav-item  d-none d-lg-flex">
                    <a target="_blank" class="nav-link" href="`+path + hostname + pathname+`/front-end/">
                        前台首頁
                    </a>
                </li>
            </ul>
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link dropdown-toggle  pl-0 pr-0" href="#" data-toggle="dropdown" id="profileDropdown">
                        <i class="typcn typcn-user-outline mr-0"></i>
                        <span class="nav-profile-name">設定</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown" style="width: 14px">
                        <a class="dropdown-item" href="/CGA103G5ALL/back-end/ManagerLogout">
                            <i class="typcn typcn-power text-primary"></i>
                            管理員登出
                        </a>
                    </div>
                </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                data-toggle="offcanvas">
                <span class="typcn typcn-th-menu"></span>
            </button>
        </div>
        `;

    const body = document.querySelector('body');
    body.insertBefore(div, body.firstChild);
    const div1 = document.querySelector('.container-scroller');
    div1.insertBefore(nav, div1.firstChild);
})();