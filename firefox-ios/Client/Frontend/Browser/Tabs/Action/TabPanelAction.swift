// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Redux
import Storage
import Common

struct MoveTabData {
    let originIndex: Int
    let destinationIndex: Int
    let isPrivate: Bool
}

class TabPanelViewAction: Action {
    let panelType: TabTrayPanelType?
    let isPrivateModeActive: Bool?
    let urlRequest: URLRequest?
    let tabUUID: TabUUID?
    let moveTabData: MoveTabData?
    let toastType: ToastType?
    let shareSheetURL: URL?
    let isInactiveTab: Bool?

    init(panelType: TabTrayPanelType?,
         isPrivateModeActive: Bool? = nil,
         urlRequest: URLRequest? = nil,
         tabUUID: TabUUID? = nil,
         moveTabData: MoveTabData? = nil,
         toastType: ToastType? = nil,
         shareSheetURL: URL? = nil,
         isInactiveTab: Bool? = nil,
         windowUUID: WindowUUID,
         actionType: ActionType) {
        self.panelType = panelType
        self.isPrivateModeActive = isPrivateModeActive
        self.urlRequest = urlRequest
        self.tabUUID = tabUUID
        self.moveTabData = moveTabData
        self.toastType = toastType
        self.shareSheetURL = shareSheetURL
        self.isInactiveTab = isInactiveTab
        super.init(windowUUID: windowUUID,
                   actionType: actionType)
    }
}

enum TabPanelViewActionType {
    case confirmCloseAllTabs
    case cancelCloseAllTabs
    case addNewTab
    // ... altre azioni ...
}

class TabPanelMiddlewareAction: Action {
    let tabDisplayModel: TabDisplayModel?
    let inactiveTabModels: [InactiveTabsModel]?
    let toastType: ToastType??
    let scrollBehavior: TabScrollBehavior?

    init(tabDisplayModel: TabDisplayModel? = nil,
         inactiveTabModels: [InactiveTabsModel]? = nil,
         toastType: ToastType? = nil,
         scrollBehavior: TabScrollBehavior? = nil,
         windowUUID: WindowUUID,
         actionType: ActionType) {
        self.tabDisplayModel = tabDisplayModel
        self.inactiveTabModels = inactiveTabModels
        self.toastType = toastType
        self.scrollBehavior = scrollBehavior
        super.init(windowUUID: windowUUID,
                   actionType: actionType)
    }
}

enum TabPanelMiddlewareActionType: ActionType {
    case didLoadTabPanel
    case willAppearTabPanel
    case didChangeTabPanel
    case refreshTabs
    case refreshInactiveTabs
    case showToast
    case scrollToTab
}

static func reduceTabPanelViewAction(action: TabPanelViewAction, state: TabTrayState) -> TabTrayState {
    switch action.actionType {
    case .confirmCloseAllTabs:
        return TabTrayState(windowUUID: state.windowUUID,
                            isPrivateMode: state.isPrivateMode,
                            selectedPanel: state.selectedPanel,
                            normalTabsCount: state.normalTabsCount,
                            hasSyncableAccount: state.hasSyncableAccount,
                            showCloseConfirmation: true)
    case .cancelCloseAllTabs:
        return TabTrayState(windowUUID: state.windowUUID,
                            isPrivateMode: state.isPrivateMode,
                            selectedPanel: state.selectedPanel,
                            normalTabsCount: state.normalTabsCount,
                            hasSyncableAccount: state.hasSyncableAccount,
                            showCloseConfirmation: false)
    default:
        return defaultState(from: state)
    }
}

func defaultState(from state: TabTrayState) -> TabTrayState {
    return state
}
