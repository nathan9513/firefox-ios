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

// Assicurati che la funzione defaultState sia definita
func defaultState(from state: TabTrayState) -> TabTrayState {
    // Implementa la logica per restituire lo stato predefinito
    return state
}static func reduceTabPanelViewAction(action: TabPanelViewAction, state: TabTrayState) -> TabTrayState {
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