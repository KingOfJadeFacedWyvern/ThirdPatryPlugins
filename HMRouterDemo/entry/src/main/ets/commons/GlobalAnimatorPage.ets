import { IHMAnimator } from '@hadss/hmrouter'

export const globalTransitionEffectPage: IHMAnimator.Effect=new IHMAnimator.Effect ({
direction:IHMAnimator.Direction.BOTTOM_TO_TOP,
  opacity:{opacity:0.5},
  scale:{x:0.5,y:0.5}
})
export const globalDialogEffectPage: IHMAnimator.Effect=new IHMAnimator.Effect ({
direction:IHMAnimator.Direction.BOTTOM_TO_TOP,
  opacity:{opacity:0.5},
  scale:{x:0.5,y:0.5}
})