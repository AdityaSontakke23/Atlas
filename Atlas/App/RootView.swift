
import SwiftUI

struct RootView: View {
    @EnvironmentObject var authService: AuthService
    @EnvironmentObject var router: AppRouter

    var body: some View {
        Group {
            if authService.isLoading {
                ProgressView()
            } else if authService.session != nil {
                MainTabView()
            } else {
                AuthView()
            }
        }
    }
}

struct MainTabView: View {
    @EnvironmentObject var router: AppRouter

    var body: some View {
        TabView(selection: $router.selectedTab) {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
                .tag(AppTab.home)

            ExploreView()
                .tabItem { Label("Explore", systemImage: "map") }
                .tag(AppTab.explore)

            StoriesView()
                .tabItem { Label("Stories", systemImage: "book") }
                .tag(AppTab.stories)

            CommunityView()
                .tabItem { Label("Community", systemImage: "person.2") }
                .tag(AppTab.community)

            ProfileView()
                .tabItem { Label("Profile", systemImage: "person.circle") }
                .tag(AppTab.profile)
        }
    }
}
