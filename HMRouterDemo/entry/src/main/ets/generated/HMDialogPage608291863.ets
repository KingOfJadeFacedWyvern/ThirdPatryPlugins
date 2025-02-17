/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// auto-generated DialogPageBuilder.ets by HMRouter
import { DialogPage } from '../commons/DialogPage'
import { TemplateService, TranslateOption, ScaleOption, OpacityOption } from '@hadss/hmrouter'

@Builder
export function DialogPageBuilder(name: string, param: Object) {
  DialogPageGenerated()
}

@Component
export struct DialogPageGenerated {
  @State translateOption: TranslateOption = new TranslateOption()
  @State scaleOption: ScaleOption = new ScaleOption()
  @State opacityOption: OpacityOption = new OpacityOption()
  private pageUrl: string = 'DialogPage'
  private ndId: string = ''
  private navigationId: string = ''

  aboutToAppear(): void {
    this.navigationId = this.queryNavigationInfo()!.navigationId;
    TemplateService.aboutToAppear(this.navigationId, this.pageUrl, true,
      this.translateOption, this.scaleOption, this.opacityOption)
  }

  aboutToDisappear(): void {
    TemplateService.aboutToDisappear(this.navigationId, this.pageUrl, this.ndId)
  }

  build() {
    NavDestination() {
      DialogPage()
    }
    .mode(NavDestinationMode.DIALOG)
    .hideTitleBar(true)
    .hitTestBehavior(HitTestMode.Transparent)
    .gesture(PanGesture()
      .onActionStart((event: GestureEvent) => {
        TemplateService.interactiveStart(this.navigationId, this.ndId, event)
      })
      .onActionUpdate((event: GestureEvent) =>{
        TemplateService.interactiveProgress(this.navigationId, this.ndId, event)
      })
      .onActionEnd((event: GestureEvent) =>{
        TemplateService.interactiveFinish(this.navigationId, this.ndId, event)
      })
    )
    .translate(this.translateOption)
    .scale(this.scaleOption)
    .opacity(this.opacityOption.opacity)
    .onAppear(() => {
      TemplateService.onAppear(this.navigationId, this.pageUrl, this.ndId)
    })
    .onDisAppear(() => {
      TemplateService.onDisAppear(this.navigationId, this.pageUrl, this.ndId)
    })
    .onShown(() => {
      TemplateService.onShown(this.navigationId, this.pageUrl, this.ndId)
    })
    .onHidden(() => {
      TemplateService.onHidden(this.navigationId, this.pageUrl, this.ndId)
    })
    .onWillAppear(() => {
      TemplateService.onWillAppear(this.navigationId, this.pageUrl)
    })
    .onWillDisappear(() => {
      TemplateService.onWillDisappear(this.navigationId, this.pageUrl, this.ndId)
    })
    .onWillShow(() => {
      TemplateService.onWillShow(this.navigationId, this.pageUrl, this.ndId)
    })
    .onWillHide(() => {
      TemplateService.onWillHide(this.navigationId, this.pageUrl, this.ndId)
    })
    .onReady((navContext: NavDestinationContext) => {
      this.ndId = navContext.navDestinationId!
      TemplateService.onReady(this.navigationId, this.pageUrl, navContext)
    })
    .onBackPressed(() => {
      return TemplateService.onBackPressed(this.navigationId, this.pageUrl, this.ndId)
    })
  }
}