#!/bin/sh

function debug() { echo "::debug::$1"; }

#阅读3.0自用定制脚本
if [ $APP_NAME = 'legado' ] && [[ $REPO_ACTOR = '10bits' ]]; then 

    debug "maven中心仓库回归"
    sed "/google()/i\        mavenCentral()" $APP_WORKSPACE/build.gradle -i

    debug "发现书籍界面优化"
    sed -e "/loadMoreView.error(it)/i\isLoading = false" \
        -e "/ExploreShowActivity/i\import org.jetbrains.anko.toast" \
        -e '/loadMoreView.error(it)/i\toast(it)' \
        -e 's/loadMoreView.error(it)/loadMoreView.error("网络请求失败或超时")/' \
        $APP_WORKSPACE/app/src/main/java/io/legado/app/ui/book/explore/ExploreShowActivity.kt -i
    sed "s/30000L/6000L/" $APP_WORKSPACE/app/src/main/java/io/legado/app/ui/book/explore/ExploreShowViewModel.kt -i
        
    debug "关闭加入书架提示"
    START=$(sed -n '/!ReadBook.inBookshelf/=' $APP_WORKSPACE/app/src/main/java/io/legado/app/ui/book/read/ReadBookActivity.kt)
    sed -e "$(echo $START+1|bc),$(echo $START+8|bc)d" \
        -e '/!ReadBook.inBookshelf/a\viewModel.removeFromBookshelf{ super.finish() }' \
        $APP_WORKSPACE/app/src/main/java/io/legado/app/ui/book/read/ReadBookActivity.kt -i
        
    debug "发现界面支持搜索书籍"
    sed -e 's/getString(R.string.screen_find)/"搜索书籍、书源"/' \
        -e '/fun initSearchView()/i\override fun onResume(){super.onResume();searchView.clearFocus()}' \
        -e '/ExploreFragment/i\import io.legado.app.ui.book.search.SearchActivity' \
        -e '/onQueryTextSubmit/a\if(!query?.contains("group:")!!){startActivity<SearchActivity>(Pair("key", query))}' \
        $APP_WORKSPACE/app/src/main/java/io/legado/app/ui/main/explore/ExploreFragment.kt -i

fi