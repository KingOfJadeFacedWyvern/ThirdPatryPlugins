import {
  HMAnimator ,
  HMAnimatorHandle ,
  HMRouterMgr ,
  IHMAnimator ,
  OpacityOption ,
  ScaleOption ,
  TranslateOption
} from '@hadss/hmrouter';

// 自定义转场动效。都需要实现这个Effect方法
/*
 * enterHandle：入场动画
 * exitHandle：出场动画
 * */
@HMAnimator ({ animatorName: 'CustomAnimator' })
export class CustomAnimator implements IHMAnimator {
  effect (enterHandle: HMAnimatorHandle , exitHandle: HMAnimatorHandle): void {
    enterHandle.duration = 500
    enterHandle.curve = Curve.Linear
    enterHandle.start ((translateOption: TranslateOption , scaleOption: ScaleOption , opacityOption: OpacityOption) => {
      // translateOption：位置坐标，以屏幕的左上角为原点，水平方向为X轴，垂直方向为Y轴，一般来说设置的是百分比，相对于屏幕宽度的百分比
      // scaleOption：缩放，X、Y进行缩放比例
      // opacityOption：透明度
      translateOption.x = '100%'
      scaleOption.x = 0.7
      opacityOption.opacity = 0.3

    })
    enterHandle.finish ((translateOption: TranslateOption , scaleOption: ScaleOption ,
      opacityOption: OpacityOption) => {
      translateOption.x = '0'
      scaleOption.x = 1
      opacityOption.opacity = 1

    })
    exitHandle.duration = 500
    exitHandle.curve = Curve.Linear
    exitHandle.start ((translateOption: TranslateOption , scaleOption: ScaleOption , opacityOption: OpacityOption) => {
      translateOption.x = '0'
      scaleOption.x = 1
      opacityOption.opacity = 1

    })
    exitHandle.finish ((translateOption: TranslateOption , scaleOption: ScaleOption , opacityOption: OpacityOption) => {
      translateOption.x = '100'
      scaleOption.x = 0.7
      opacityOption.opacity = 0.3

    })


  }

  // interactive：用于和我们手势交互的场景动画，当我们的出场入场效果与用户的手势操作同时产生效果时，需要使用 interactive 方法
  interactive? (handle: HMAnimatorHandle): void {

    /*
     * handle：动画句柄，用于控制动画的开始、结束等
     *           actionStart返回一个回调，用于监听手势开始，当手势开始时，会调用这个回调，参数为手势事件（GestureEvent）
     * */
    handle.actionStart ((event: GestureEvent) => {
      if (event.offsetX > 0) {
        HMRouterMgr.pop ()
      }
    })

    handle.updateProgress ((
      /*
       * 1.event：手势事件，包含手指列表、手势类型、手势位置等
       * 2.proxy：代理对象，用于控制动画的开始、结束等。就是代理effect，我们可以通过proxy去更新effect的当前的进度
       * 3.operation：动作。枚举，有push、pop、replace。一般用不着
       * 4.startOffset：开始坐标偏移量，手指头点击开始的时候偏移量
       * */
      event: GestureEvent ,
      proxy: NavigationTransitionProxy | undefined ,
      operation: NavigationOperation | undefined ,
      startOffset?: number
    ) => {
      if (!proxy?.updateTransition || !startOffset) {
        // console.log ('updateTransition fail')
        return
      }
      // 计算移动的偏移量
      let offset = event.fingerList[0].localX - startOffset
      // 判断从右向左移移动的动画不产生效果
      if (offset < 0) {
        proxy.updateTransition (0)
        return
      }
      // 获取手势事件对应的屏幕整体宽度
      let areaWidth = event.target.area.width as number
      // 计算当前偏移量数量占整体屏幕宽度的百分比
      let rate = offset / areaWidth
      proxy.updateTransition (rate)
    })

    handle.actionEnd ((
      event: GestureEvent ,
      proxy: NavigationTransitionProxy | undefined ,
      operation: NavigationOperation | undefined ,
      startOffset?: number) => {
      if (!proxy?.updateTransition || !startOffset) {
        return
      }
      let offset = event.fingerList[0].localX - startOffset
      if (offset < 0) {
        proxy.updateTransition (0)
        return
      }
      let areaWidth = event.target.area.width as number
      let rate = offset / areaWidth
      if (rate > 0.6) {
        proxy?.finishTransition ()
        console.log ('finishTransition：' + proxy?.finishTransition ())

      } else {
        proxy?.cancelTransition?.()
        console.log ('cancelTransition：' + proxy?.cancelTransition?.())
      }
    })

  }
}
