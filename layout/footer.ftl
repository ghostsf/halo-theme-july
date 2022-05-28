<footer id="footer" class="footer">
    <div class="footer-inner">
        <@global.statistics />
        <@global.footer />
        <#if settings.blog_ran_time??>
            <p>
                <span id="timeDate">站点已运行 00 天 </span><span id="times">00 小时 00 分 00 秒</span><span class="my-face">(●'◡'●)ﾉ♥</span>
            </p>
            <script>
                $(function () {
                    setInterval("sagiri.blogRanTime(new Date, '${settings.blog_ran_time!}')", 250);
                })
            </script>
        </#if>
        <p>Copyright &copy; ${.now?string('yyyy')}
            <a href="${blog_url!}"> ${user.nickname!} </a>
            <#if settings.icp??>
                <a href="https://beian.miit.gov.cn" target="_blank">${settings.icp!}</a><br>
            </#if>
        </p>
        <p>
            Power by <a href="https://halo.run" target="_blank" class="external" rel="nofollow"> Halo</a> · Theme by
            <a href="https://github.com/ghostsf/halo-theme-july" target="_blank" class="external" rel="nofollow">
                Sagiri
            </a>
        </p>
    </div>
</footer>
