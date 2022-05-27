<article>
    <#if !(settings.patternimg!true) || (!(settings.links_patternimg?? && settings.links_patternimg!='') && !(is_sheet?? && sheet.thumbnail?? && sheet.thumbnail!=''))>
        <header class="entry-header">
            <h1 class="entry-title">热度排行榜</h1>
        </header><!-- .entry-header -->
    </#if>
    <#if is_sheet??>
        ${sheet.formatContent!}
    </#if>
    <div class="">
        <@postTag method="count">
            <@postTag method="latest" top="${count}">
                <#assign postCunt = 0 />
                <#list posts?sort_by("visits")?reverse as post>
                    <article class="post post-list-thumb post-list-thumb-left" itemscope=""
                             itemtype="http://schema.org/BlogPosting">
                        <div class="post-thumb">
                            <#if post.thumbnail?? && post.thumbnail!=''>
                                <a href="${post.fullPath!}">
                                    <img class="lazyload"
                                         src="${res_base_url!}/source/images/svg/loader/orange.progress-bar-stripe-loader.svg"
                                         data-src="${post.thumbnail!}" onerror="imgError(this, IMG_Type.DEFAULT)">
                                </a>
                            <#else>
                                <a href="${post.fullPath!}">
                                    <img class="lazyload"
                                         src="${res_base_url!}/source/images/svg/loader/orange.progress-bar-stripe-loader.svg"
                                         data-src="${theme_base!}/images/temp.jpg"
                                         onerror="imgError(this, IMG_Type.DEFAULT)">
                                </a>
                            </#if>
                        </div><!-- thumbnail-->
                        <div class="post-content-wrap">
                            <div class="post-content">
                                <div class="post-date">
                                    <i class="iconfont">&#xe65f;</i>发布于 ${post.createTime?string("yyyy-MM-dd")}
                                    <#if (.now?long-86400000*5)?number_to_datetime lte post.editTime?datetime && post.editTime?datetime gt post.createTime?datetime>
                                        <i class="fa fa-refresh" aria-hidden="true" title="最近有更新"
                                           style="color: var(--code-toolbar-color);font-size:11px"></i>
                                    </#if>
                                    <#if post.topPriority?? && post.topPriority!=0>
                                        &nbsp;<i class="iconfont hotpost">&#xe758;</i>
                                    </#if>
                                </div>
                                <a href="${post.fullPath!}" class="post-title"><h3>${post.title!}</h3></a>
                                <div class="post-meta">
				<span>
					<i class="iconfont">&#xe73d;</i>${post.visits?c} 热度
				</span>
                                    <span class="comments-number">
					<i class="iconfont">&#xe731;</i>${post.commentCount!0} 条评论
				</span>
                                    <#if post.categories?? && post.categories?size gt 0>
                                        <span>
					<i class="iconfont">&#xe739;</i>
					<a href="${post.categories[0].fullPath!}">${post.categories[0].name!}</a>
				</span>
                                    </#if>
                                </div>
                                <div class="float-content">
                                    <p>${post.summary!}</p>
                                    <div class="post-bottom">
                                        <a href="${post.fullPath!}" class="button-normal"><i class="iconfont icon-caidan"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>

                    <#assign postCunt++ />
                    <#if postCunt == 10>
                        <#break>
                    </#if>
                </#list>
            </@postTag>
        </@postTag>
    </div>
</article>
