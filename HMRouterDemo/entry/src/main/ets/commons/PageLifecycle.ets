import { HMLifecycle , HMLifecycleContext , IHMLifecycle } from '@hadss/hmrouter';

@HMLifecycle ({ lifecycleName: 'PageLifecycle' })
export class PageLifecycle implements IHMLifecycle {
  lastTime: number = 0
  onPrepare (ctx: HMLifecycleContext): void {
    // console.log ('PageLifecycle onPrepare飞龙')
  }

  onAppear (ctx: HMLifecycleContext): void {
    // console.log ('PageLifecycle onAppear飞龙')
  }

  onDisAppear (ctx: HMLifecycleContext): void {
    // console.log ('PageLifecycle onDisAppear飞龙')
  }

  onShown (ctx: HMLifecycleContext): void {
    // console.log ('PageLifecycle onShown飞龙')
  }

  onHidden (ctx: HMLifecycleContext): void {
    // console.log ('PageLifecycle onHidden飞龙')
  }
  onWillAppear(ctx: HMLifecycleContext): void {
    // console.log ('PageLifecycle onWillAppear飞龙')
  }
  onWillDisAppear(ctx: HMLifecycleContext): void {
    // console.log ('PageLifecycle onWillDisAppear飞龙')
  }
  onWillShow(ctx: HMLifecycleContext): void {
    // console.log ('PageLifecycle onWillShow飞龙')
  }
  onWillHide(ctx: HMLifecycleContext): void {
    // console.log ('PageLifecycle onWillHide飞龙')
  }
  onReady(ctx: HMLifecycleContext): void {
    // console.log ('PageLifecycle onReady飞龙')
  }
  onBackPressed(ctx: HMLifecycleContext): boolean {
    let time=new Date().getTime()
    if (time-this.lastTime>1000) {
      this.lastTime=time
      ctx.uiContext.getPromptAction().showToast({
        message: '再按一次返回键退出',
        duration: 1000
      })
      return true
    }else {
      return false
    }
  }
}