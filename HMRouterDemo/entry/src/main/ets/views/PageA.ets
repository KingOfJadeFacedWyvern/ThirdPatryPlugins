import { HMRouter , HMRouterMgr } from '@hadss/hmrouter'
//@HMRouter ({lifecycle: 'PageLifecycle' })这个属性是生命周期监听，可以监听到页面的生命周期
@HMRouter ({ pageUrl: 'PageA' , lifecycle: 'PageLifecycle' })
@Component
export struct pageA {
  // aboutToAppear (): void {
  //   HMRouterMgr.push ({
  //     pageUrl: 'DialogPage' ,//弹框页面
  //   })
  // }

  build () {
    Column () {
      Text ('PageA')
        .fontSize (50)
      // Button ('返回主页').onClick ((event: ClickEvent) => {
      //   HMRouterMgr.pop({
      //     pageUrl:'PageB',
      //     param:'1111'
      //   })
      // })
      // .fontSize (20)
    }
  }
}