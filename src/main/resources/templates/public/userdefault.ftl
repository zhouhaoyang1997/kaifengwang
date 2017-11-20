<#macro user_nav>
<div class="user_nav">
    <div class="container_self">
        <div class="row">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-4">
                        <div class="user_logo">
                            <h2><a href="${base}/index"><span>麦芒网</span></a></h2>
                        </div>
                    </div>
                    <#nested >
                </div>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-offset-8 col-md-4">
                        <a class="btn push_btn" href="${base}/push/choose">发布信息</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</#macro>