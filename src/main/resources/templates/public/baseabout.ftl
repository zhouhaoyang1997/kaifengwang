<#macro menu>
<div class="container_self">
    <div class="row">
        <div class="col-md-3">
            <div class="logo">
                <h1><a href="${base}/index">开封<span>城市网</span></a></h1>
            </div>
        </div>
    </div>
</div>
<div class="mainmenu-about">
    <div class="container">
        <div class="row">
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <#nested >
                </ul>
            </div>
        </div>
    </div>
</div>
</#macro>