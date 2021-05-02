# ava-explorer-ios

SwiftUI based iOS app for querying Avalanche blockchain data via the Covalent API.

Feedback and suggestions: https://avaxios.changecrab.com/suggestions

Features:
- fetch and filter token balances
- get NFT data
- Smart contract transaction info

App architecture:
- MVVM design
- repository pattern (see DataRepository.swift), using dependency injection with Resolver pod

![ava-ios](https://user-images.githubusercontent.com/3171346/115157519-1a2cb280-a08a-11eb-99e8-b2fbcb36f239.png)


Dependencies:
- Resolver (https://github.com/hmlongco/Resolver)
- Kingfisher (https://github.com/onevcat/Kingfisher)
- Alamofire (https://github.com/Alamofire/Alamofire)
- NotificationBanner (https://github.com/Daltron/NotificationBanner)
