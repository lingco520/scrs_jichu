<!DOCTYPE html>
<html>
<head>
<#include "../header.ftl">
<#include "../edit.ftl">
    <style>

        #secondTable td {
            width: 9%;
        }

        /*---------------新增数据处---------------*/

        .demo-button .add:hover {
            border-color: #20a0ff;
        }

        .demo-button .add:hover i {
            color: #20a0ff;
        }

        .demo-button .remove:hover {
            border-color: #ff4949;
        }

        .demo-button .remove:hover i {
            color: #ff4949;
        }

        .form-item-table table .form-label {
            height: auto;
            line-height: inherit;
            text-align: center;
        }

        .comm-checkbox .daq-checkbox {
            margin: 0;
            float: none;
        }

        .form-item-table table td.form-tab-label {
            width: auto;
        }

        .form-item-table table td {
            text-align: center;
        }

        .daq-select {
            text-align: left;
        }

        .kindCheckbox {
            min-width: 130px;
        }

        #thunderData input {
            text-align: center;
        }

        .base-data-tit h3 {
            font: bold 18px/50px 'Microsoft YaHei UI';
        }
    </style>
</head>
<script type="text/javascript" src="/script/jQuery/jquery.lSelect.js"></script>
<body>
<div class="system-top">
    <p class="daq-crumb clearfix">
        <a href="javascript:;" class=""><i class="sysfont"></i> 数据模拟</a>
        <i class="sysfont crumb-sign sysfont"></i>
        <a href="javascript:;" class=""><i class="sysfont"></i> 实时数据</a>
    </p>
</div>
<div class="section-content">
    <div class="section-son-content">
        <div class="form-content">
            <div class="base-data-tit">
                <h3>HTML模板页配置</h3>
            </div>
            <form id="validateForm" action="">
                <div class="form-item-table">
                    <div id="firstTable">
                        <table cellpadding="0" cellspacing="0" width="100%" id="table">
                            <tr id="date" name="数据模拟时间段">
                                <td class="form-tab-label"><label class="form-label">时间选择</label></td>
                                <td class="form-tab-label"><label class="form-label">开始时间</label></td>
                                <td colspan="3">
                                    <div class="form-table-edit">
                                        <div class="daq-date daq-inp-rule daq-inp-date">
                                            <input class="date" name="startDate" id="startDate" value=""
                                                   placeholder="请选择开始时间"/>
                                            <i class="sysfont date-icon"></i>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">结束时间</label></td>
                                <td colspan="3">
                                    <div class="form-table-edit">
                                        <div class="daq-date daq-inp-rule daq-inp-date">
                                            <input class="date" name="endDate" id="endDate" value=""
                                                   placeholder="请选择结束时间"/>
                                            <i class="sysfont date-icon"></i>
                                        </div>
                                    </div>
                                </td>

                                <td class="form-tab-label"><label class="form-label">全选</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div>
                                            <input type="checkbox" class="checkboxAll" name="allSure"
                                               <#if "1" == (dto.allSure)!?string>checked</#if> value="1" title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!--实时人数开始-->
                            <tr class="signData" id="teamTour" name="团队">
                                <td class="form-tab-label"><label class="form-label">团队</label></td>
                                <td class="form-tab-label"><label class="form-label">团队人数最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" id="teamAmountMin" name="teamAmountMin"
                                                   class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,10],messages:{digits: '请输入非负整数且小于10'}}"
                                                   value="${dto.teamAmountMin!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">团队人数最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="teamAmountMax" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,9999],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.teamAmountMax!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="4"></td>
                                <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div class="sureCheckbox">
                                            <input type="checkbox" name="teamSure"
                                               <#if "1" == (dto.teamSure)!?string>checked</#if> value="1" title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <input type="hidden" name="flowHourSureStr" value=""/>
                        <#if flowHourList??>
                            <#list flowHourList as flowHour>
                                <tr class="signData flow" id="flow" name="流量统计">
                                    <td class="form-tab-label"><label class="form-label">流量统计</label></td>
                                    <td class="form-tab-label"><label class="form-label">类型</label></td>
                                    <td id="sourceTd">
                                        <div class="form-table-edit">
                                            <div class="daq-select flowSource">
                                                <select name="flowSource" validate="{required:true}">
                                                    <option value="">请选择</option>
                                                    <option value="1" <#if '1' == (flowHour.flowSource)!>selected</#if>>
                                                        官网
                                                    </option>
                                                    <option value="2" <#if '2' == (flowHour.flowSource)!>selected</#if>>
                                                        网站
                                                    </option>
                                                    <option value="3" <#if '3' == (flowHour.flowSource)!>selected</#if>>
                                                        微博
                                                    </option>
                                                    <option value="4" <#if '4' == (flowHour.flowSource)!>selected</#if>>
                                                        微信
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="form-tab-label"><label class="form-label">每小时访问量最小值</label></td>
                                    <td>
                                        <div class="form-table-edit">
                                            <div class="daq-inp-rule">
                                                <input type="text" name="flowHourMin" class="s_input s_input_fb"
                                                       validate="{required:true,checkMinMax:true,digits: true,range:[1,10],messages:{digits: '请输入非负整数且小于10'}}"
                                                       value="${flowHour.flowHourMin!''}"/>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="form-tab-label"><label class="form-label">每小时访问量最大值</label></td>
                                    <td>
                                        <div class="form-table-edit">
                                            <div class="daq-inp-rule">
                                                <input type="text" name="flowHourMax" class="s_input s_input_fb"
                                                       validate="{required:true,digits: true,range:[1,9999],messages:{digits: '请输入非负整数'}}"
                                                       value="${flowHour.flowHourMax!''}"/>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="form-tab-label"><label class="form-label">新增流量统计</label></td>
                                    <td>
                                        <div class="demo-button">
                                            <div class="daq-btn-line btn-icon add">
                                                <i class="sysfont"></i>
                                            </div>
                                            <div class="daq-btn-line btn-icon remove">
                                                <i class="sysfont"></i>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                    <td class="checkboxTd">
                                        <div class="form-table-edit">
                                            <div class="sureCheckbox">
                                                <input type="checkbox" name="flowHourSure"
                                                       <#if "1" == (flowHour.flowHourSureStr)!?string>checked</#if>
                                                       value="1" title="是"/>
                                            </div>
                                        </div>
                                    </td>


                                </tr>
                            </#list>
                        </#if>
                            <tr class="signData" id="portrayal" name="游客画像">
                                <td class="form-tab-label"><label class="form-label">游客画像</label></td>
                                <td class="form-tab-label"><label class="form-label">男性比例最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="manRatioMin" class="s_input s_input_fb"
                                                   validate="{required:true,checkManRatioMin:true,digits: true,range:[1,10],messages:{digits: '请输入非负整数且小于100'}}"
                                                   value="${dto.manRatioMin!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">男性比例最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="manRatioMax" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,100],messages:{digits: '请输入非负整数且小于100'}}"
                                                   value="${dto.manRatioMax!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">每天总人数最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="portrayalAmountMin" class="s_input s_input_fb"
                                                   validate="{required:true,checkPortrayalAmountMin:true,digits: true,range:[1,99999],messages:{digits: '请输入非负整数且小于99999'}}"
                                                   value="${dto.portrayalAmountMin!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">每天总人数最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="portrayalAmountMax" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,33333],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.portrayalAmountMax!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div class="sureCheckbox">
                                            <input type="checkbox" name="portrayalSure"
                                               <#if "1" == (dto.portrayalSure)!?string>checked</#if> value="1"
                                                   title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>

                            <tr class="signData" id="passengerDay" name="景区日客流趋势分析">
                                <td class="form-tab-label"><label class="form-label">景区日客流趋势分析</label></td>
                                <td class="form-tab-label"><label class="form-label">进入人数最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="enterMin" class="s_input s_input_fb"
                                                   validate="{required:true,checkEnterMin:true,digits: true,range:[1,33333],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.enterMin!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">进入人数最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="enterMax" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,99999],messages:{digits: '请输入非负整数且小于99999'}}"
                                                   value="${dto.enterMax!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">离开人数最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="leaveMin" class="s_input s_input_fb"
                                                   validate="{required:true,checkLeaveMin:true,digits: true,range:[1,33333],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.leaveMin!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">离开人数最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="leaveMax" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,99999],messages:{digits: '请输入非负整数且小于99999'}}"
                                                   value="${dto.leaveMax!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div class="sureCheckbox">
                                            <input type="checkbox" name="passengerDaySure"
                                               <#if "1" == (dto.passengerDaySure)!?string>checked</#if> value="1"
                                                   title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="signData" id="futureTicket" name="未来6天票务预测">
                                <td class="form-tab-label"><label class="form-label">未来6天票务预测</label></td>
                                <td class="form-tab-label"><label class="form-label">线上最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="onlineMin" class="s_input s_input_fb"
                                                   validate="{required:true,checkOnlineMin:true,digits: true,range:[1,33333],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.onlineMin!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">线上最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="onlineMax" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,99999],messages:{digits: '请输入非负整数且小于99999'}}"
                                                   value="${dto.onlineMax!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">线下最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="offlineMin" class="s_input s_input_fb"
                                                   validate="{required:true,checkOfflineMin:true,digits: true,range:[1,33333],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.offlineMin!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">线下最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="offlineMax" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,99999],messages:{digits: '请输入非负整数且小于99999'}}"
                                                   value="${dto.offlineMax!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div class="sureCheckbox">
                                            <input type="checkbox" name="offlineSure"
                                               <#if "1" == (dto.offlineSure)!?string>checked</#if> value="1" title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="signData" id="futurePassenger" name="未来6天客流分析">
                                <td class="form-tab-label"><label class="form-label">未来6天客流分析</label></td>
                                <td class="form-tab-label"><label class="form-label">预计人数最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="predictMin" class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,33333],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.predictMin!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">预计人数最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="predictMax" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,99999],messages:{digits: '请输入非负整数且小于99999'}}"
                                                   value="${dto.predictMax!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="4"></td>
                                <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div class="sureCheckbox">
                                            <input type="checkbox" name="predictSure"
                                               <#if "1" == (dto.predictSure)!?string>checked</#if> value="1" title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>


                            <tr class="signData" id="wpData" name="网评数据">
                                <td class="form-tab-label"><label class="form-label">网评数据</label></td>
                                <td class="form-tab-label"><label class="form-label">网评数据最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="wpMinNum" class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,9999],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.wpMinNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">网评数据最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="wpMaxNum" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,9999],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.wpMaxNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="4"></td>
                                <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div class="sureCheckbox">
                                            <input type="checkbox" name="wpSure"
                                               <#if "1" == (dto.wpSure)!?string>checked</#if> value="1" title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="signData lingering" id="lingering" name="游客驻留时长">
                                <td class="form-tab-label"><label class="form-label">游客驻留时长</label></td>
                                <td class="form-tab-label"><label class="form-label">每天总人数最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="lingeringAmountMinOne"
                                                   class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,99999],messages:{digits: '请输入非负整数且小于99999'}}"
                                                   value="${dto.lingeringAmountMinOne!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">每天总人数最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="lingeringAmountMaxOne"
                                                   class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,33333],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.lingeringAmountMaxOne!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="kindCheckbox" class="mt-5 clearfix choose-box">
                                        <input type="checkbox" name="kindOne"
                                           <#if "1" == (dto.kindOne)!?string>checked</#if> value="1" title="0-1小时"/>
                                    </div>
                                </td>
                            <#--占位列-->
                                <td colspan="3"></td>
                                <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div class="sureCheckbox">
                                            <input type="checkbox" class="lingeringSure" name="lingeringSure"
                                                   value="1"
                                                   title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="signData lingering" id="lingering" name="游客驻留时长">
                                <td class="form-tab-label"><label class="form-label"></label></td>
                                <td class="form-tab-label"><label class="form-label">每天总人数最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="lingeringAmountMinTwo"
                                                   class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,99999],messages:{digits: '请输入非负整数且小于99999'}}"
                                                   value="${dto.lingeringAmountMinTwo!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">每天总人数最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="lingeringAmountMaxTwo"
                                                   class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,33333],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.lingeringAmountMaxTwo!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="kindCheckbox" class="mt-5 clearfix choose-box">
                                        <input type="checkbox" name="kindTwo"
                                           <#if "2" == (dto.kindTwo)!?string>checked</#if> value="2" title="1-3小时"/>
                                    </div>
                                </td>
                                <td colspan="5"></td>
                            </tr>
                            <tr class="signData lingering" id="lingering" name="游客驻留时长">
                                <td class="form-tab-label"><label class="form-label"></label></td>
                                <td class="form-tab-label"><label class="form-label">每天总人数最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="lingeringAmountMinThree"
                                                   class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,99999],messages:{digits: '请输入非负整数且小于99999'}}"
                                                   value="${dto.lingeringAmountMinThree!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">每天总人数最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="lingeringAmountMaxThree"
                                                   class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,33333],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.lingeringAmountMaxThree!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="kindCheckbox" class="mt-5 clearfix choose-box">
                                        <input type="checkbox" name="kindThree"
                                           <#if "3" == (dto.kindThree)!?string>checked</#if> value="3" title="3-6小时"/>
                                    </div>
                                </td>
                                <td colspan="5"></td>
                            </tr>
                            <tr class="signData lingering" id="lingering" name="游客驻留时长">
                                <td class="form-tab-label"><label class="form-label"></label></td>
                                <td class="form-tab-label"><label class="form-label">每天总人数最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="lingeringAmountMinFour"
                                                   class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,99999],messages:{digits: '请输入非负整数且小于99999'}}"
                                                   value="${dto.lingeringAmountMinFour!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">每天总人数最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="lingeringAmountMaxFour"
                                                   class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,33333],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.lingeringAmountMaxFour!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="kindCheckbox" class="mt-5 clearfix choose-box">
                                        <input type="checkbox" name="kindFour"
                                           <#if "4" == (dto.kindFour)!?string>checked</#if> value="4" title="6小时以上"/>
                                    </div>
                                </td>
                                <td colspan="5"></td>
                            </tr>
                            <tr class="signData lingering" id="lingering" name="游客驻留时长">
                                <td class="form-tab-label"><label class="form-label"></label></td>
                                <td class="form-tab-label"><label class="form-label">每天总人数最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="lingeringAmountMinFive"
                                                   class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,99999],messages:{digits: '请输入非负整数且小于99999'}}"
                                                   value="${dto.lingeringAmountMinFive!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">每天总人数最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="lingeringAmountMaxFive"
                                                   class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,33333],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.lingeringAmountMaxFive!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="kindCheckbox" class="mt-5 clearfix choose-box">
                                        <input type="checkbox" name="kindFive"
                                           <#if "5" == (dto.kindFive)!?string>checked</#if> value="5" title="6-12小时"/>
                                    </div>
                                </td>
                                <td colspan="5"></td>
                            </tr>
                            <tr class="signData lingering" id="lingering" name="游客驻留时长">
                                <td class="form-tab-label"><label class="form-label"></label></td>
                                <td class="form-tab-label"><label class="form-label">每天总人数最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="lingeringAmountMinSix"
                                                   class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,99999],messages:{digits: '请输入非负整数且小于99999'}}"
                                                   value="${dto.lingeringAmountMinSix!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">每天总人数最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="lingeringAmountMaxSix"
                                                   class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,33333],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.lingeringAmountMaxSix!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="kindCheckbox" class="mt-5 clearfix choose-box">
                                        <input type="checkbox" name="kindSix"
                                           <#if "6" == (dto.kindSix)!?string>checked</#if> value="6" title="12-24小时"/>
                                    </div>
                                </td>
                                <td colspan="5"></td>
                            </tr>
                            <tr class="signData lingering" id="lingering" name="游客驻留时长">
                                <td class="form-tab-label"><label class="form-label"></label></td>
                                <td class="form-tab-label"><label class="form-label">每天总人数最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="lingeringAmountMinSeven"
                                                   class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,99999],messages:{digits: '请输入非负整数且小于99999'}}"
                                                   value="${dto.lingeringAmountMinSeven!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">每天总人数最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="lingeringAmountMaxSeven"
                                                   class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,33333],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.lingeringAmountMaxSeven!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="kindCheckbox" class="mt-5 clearfix choose-box">
                                        <input type="checkbox" name="kindSeven"
                                           <#if "7" == (dto.kindSeven)!?string>checked</#if> value="7" title="24-48小时"/>
                                    </div>
                                </td>
                                <td colspan="5"></td>
                            </tr>
                            <tr id="operateNextStep">
                                <td colspan="11" class="dq_dt_ltd">
                                    <div class="form-table-edit">
                                        <input type="button" class="daq-btn btn-pad-30 media-btn mt-5"
                                               onclick="nextStep();"
                                               value="下一步"/>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="secondTable" class="none">
                        <table cellpadding="0" cellspacing="0" width="100%" id="tableTwo">
                            <tr class="signData" id="aqiData" name="AQI数据">
                                <td class="form-tab-label"><label class="form-label">AQI数据</label></td>
                                <td class="form-tab-label"><label class="form-label">最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="aqiMinNum" class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,10],messages:{digits: '请输入非负整数且小于10'}}"
                                                   value="${dto.aqiMinNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="aqiMaxNum" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,9999],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.aqiMaxNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="4"></td>
                                <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div class="sureCheckbox">
                                            <input type="checkbox" name="aqiSure"
                                               <#if "1" == (dto.aqiSure)!?string>checked</#if> value="1" title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="signData" id="oxyData" name="负氧离子指数">
                                <td class="form-tab-label"><label class="form-label">负氧离子指数</label></td>
                                <td class="form-tab-label"><label class="form-label">最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="oxyMinNum" class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,10],messages:{digits: '请输入非负整数且小于10'}}"
                                                   value="${dto.oxyMinNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="oxyMaxNum" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,99999],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.oxyMaxNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="4"></td>
                                <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div class="sureCheckbox">
                                            <input type="checkbox" name="oxySure"
                                               <#if "1" == (dto.oxySure)!?string>checked</#if> value="1" title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="signData" id="airHumData" name="景区空气湿度">
                                <td class="form-tab-label"><label class="form-label">景区空气湿度</label></td>
                                <td class="form-tab-label"><label class="form-label">最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="airHumMinNum" class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,10],messages:{digits: '请输入非负整数且小于10'}}"
                                                   value="${dto.airHumMinNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="airHumMaxNum" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,99],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.airHumMaxNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="4"></td>
                                <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div class="sureCheckbox">
                                            <input type="checkbox" name="airHumSure"
                                               <#if "1" == (dto.airHumSure)!?string>checked</#if> value="1" title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!--景区降水量数据-->
                            <tr class="signData" id="rainData" name="景区降水量">
                                <td class="form-tab-label"><label class="form-label">景区降水量</label></td>
                                <td class="form-tab-label"><label class="form-label">最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="rainMinNum" class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,10],messages:{digits: '请输入非负整数且小于10'}}"
                                                   value="${dto.rainMinNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="rainMaxNum" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,99],messages:{digits: '请输入非负整数'}}"
                                                   value="${dto.rainMaxNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="4"></td>
                                <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div class="sureCheckbox">
                                            <input type="checkbox" name="rainSure"
                                               <#if "1" == (dto.rainSure)!?string>checked</#if> value="1" title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="signData" id="ultData" name="景区紫外线">
                                <td class="form-tab-label"><label class="form-label">景区紫外线</label></td>
                                <td class="form-tab-label"><label class="form-label">最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="ultMinNum" class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,10],messages:{digits: '请输入非负整数且小于10'}}"
                                                   value="${dto.ultMinNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="ultMaxNum" class="s_input s_input_fb"
                                                   validate="{required:true,range:[0,999]}"
                                                   value="${dto.ultMaxNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="4"></td>
                                <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div class="sureCheckbox">
                                            <input type="checkbox" name="ultSure"
                                               <#if "1" == (dto.ultSure)!?string>checked</#if> value="1" title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="signData" id="thunderData" name="雷电位置">
                                <td class="form-tab-label"><label class="form-label">雷电位置</label></td>
                                <td class="form-tab-label"><label class="form-label">经纬度选择</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input class="thunderLongitude" name="thunderLongitude"
                                                   value="${dto.thunderLongitude!}" type="text" placeholder="经度"
                                                   readonly>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input class="thunderLatitude" name="thunderLatitude"
                                                   value="${dto.thunderLatitude!}" type="text"
                                                   validate="{required:true}"
                                                   placeholder="纬度"
                                                   readonly>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="form-table-edit">
                                        <button id="mbBox9" class="daq-btn-line blue-line"
                                                onclick="getLongAndLat('thunderLongitude','thunderLatitude')"
                                                type="button">
                                            标注
                                        </button>
                                    </div>
                                </td>
                                <td colspan="4"></td>
                                <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div class="sureCheckbox">
                                            <input type="checkbox" name="thunderSure"
                                               <#if "1" == (dto.thunderSure)!?string>checked</#if> value="1" title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="signData" id="travelTeamData" name="旅行社团队">
                                <td class="form-tab-label"><label class="form-label">旅行社团队</label></td>
                                <td class="form-tab-label"><label class="form-label">最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="travelTeamMinNum" class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,10],messages:{digits: '请输入非负整数且小于10'}}"
                                                   value="${dto.travelTeamMinNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="travelTeamMaxNum" class="s_input s_input_fb"
                                                   validate="{required:true,range:[0,999]}"
                                                   value="${dto.travelTeamMaxNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="4"></td>
                                <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div class="sureCheckbox">
                                            <input type="checkbox" name="travelTeamSure"
                                               <#if "1" == (dto.temperatureSure)!?string>checked</#if> value="1"
                                                   title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="signData temperature" id="temperatureData" name="水文监测数据">
                                <td class="form-tab-label"><label class="form-label">水文监测数据</label></td>
                                <td class="form-tab-label"><label class="form-label">流量最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="flowMinNum" class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,10],messages:{digits: '请输入非负整数且小于10'}}"
                                                   value="${dto.flowMinNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">流量最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="flowMaxNum" class="s_input s_input_fb"
                                                   validate="{required:true,range:[0,999]}"
                                                   value="${dto.flowMaxNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="6"></td>
                            </tr>
                            <tr class="signData temperature" id="temperatureData" name="水文监测数据">
                                <td class="form-tab-label"><label class="form-label"></label></td>
                                <td class="form-tab-label"><label class="form-label">流速最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="speedMinNum" class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,10],messages:{digits: '请输入非负整数且小于10'}}"
                                                   value="${dto.speedMinNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">流速最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="speedMaxNum" class="s_input s_input_fb"
                                                   validate="{required:true,range:[0,999]}"
                                                   value="${dto.speedMaxNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="6"></td>
                            </tr>
                            <tr class="signData temperature" id="temperatureData" name="水文监测数据">
                                <td class="form-tab-label"><label class="form-label"></label></td>
                                <td class="form-tab-label"><label class="form-label">水深最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="depthMinNum" class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,10],messages:{digits: '请输入非负整数且小于10'}}"
                                                   value="${dto.depthMinNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">水深最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="depthMaxNum" class="s_input s_input_fb"
                                                   validate="{required:true,range:[0,999]}"
                                                   value="${dto.depthMaxNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="6"></td>
                            </tr>
                            <tr class="signData temperature" id="temperatureData" name="水文监测数据">
                                <td class="form-tab-label"><label class="form-label"></label></td>
                                <td class="form-tab-label"><label class="form-label">水宽最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="widthMinNum" class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,10],messages:{digits: '请输入非负整数且小于10'}}"
                                                   value="${dto.widthMinNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">水宽最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="widthMaxNum" class="s_input s_input_fb"
                                                   validate="{required:true,range:[0,999]}"
                                                   value="${dto.widthMaxNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="6"></td>
                            </tr>
                            <tr class="signData temperature" id="temperatureData" name="水文监测数据">
                                <td class="form-tab-label"><label class="form-label"></label></td>
                                <td class="form-tab-label"><label class="form-label">水温最小值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="temperatureMinNum" class="s_input s_input_fb"
                                                   validate="{required:true,checkMinMax:true,digits: true,range:[1,10],messages:{digits: '请输入非负整数且小于10'}}"
                                                   value="${dto.temperatureMinNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">水温最大值</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="temperatureMaxNum" class="s_input s_input_fb"
                                                   validate="{required:true,range:[0,999]}"
                                                   value="${dto.temperatureMaxNum!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="4"></td>
                                <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div class="sureCheckbox">
                                            <input type="checkbox" class="temperatureSure" name="temperatureSure"
                                               <#if "1" == (dto.temperatureSure)!?string>checked</#if> value="1"
                                                   title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="signData busYear" id="busData" name="五年大巴车">
                                <td class="form-tab-label"><label class="form-label">五年大巴车</label></td>
                                <td class="form-tab-label"><label class="form-label">第一年</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="oneYear" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,999999],messages:{digits: '请输入非负整数且小于999999'}}"
                                                   value="${dto.oneYear!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">第二年</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="twoYear" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,999999],messages:{digits: '请输入非负整数且小于999999'}}"
                                                   value="${dto.twoYear!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">第三年</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="threeYear" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,999999],messages:{digits: '请输入非负整数且小于999999'}}"
                                                   value="${dto.threeYear!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="4"></td>
                            </tr>
                            <tr class="signData busYear" id="busData" name="五年大巴车">
                                <td class="form-tab-label"><label class="form-label"></label></td>
                                <td class="form-tab-label"><label class="form-label">第四年</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="fourYear" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,999999],messages:{digits: '请输入非负整数且小于999999'}}"
                                                   value="${dto.fourYear!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">第五年</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="fiveYear" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,999999],messages:{digits: '请输入非负整数且小于999999'}}"
                                                   value="${dto.fiveYear!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="4"></td>
                                <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div class="sureCheckbox">
                                            <input type="checkbox" class="busSure" name="busSure"
                                               <#if "1" == (dto.busSure)!?string>checked</#if> value="1" title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="signData holiday" id="holidayData" name="节假日客流模拟">
                                <td class="form-tab-label"><label class="form-label">节假日客流</label></td>
                                <td class="form-tab-label"><label class="form-label">元旦</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="newYear" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,999999],messages:{digits: '请输入非负整数且小于999999'}}"
                                                   value="${dto.newYear!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">春节</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="spring" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,999999],messages:{digits: '请输入非负整数且小于999999'}}"
                                                   value="${dto.spring!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">清明</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="tombSweeping" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,999999],messages:{digits: '请输入非负整数且小于999999'}}"
                                                   value="${dto.tombSweeping!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">劳动</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="labour" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,999999],messages:{digits: '请输入非负整数且小于999999'}}"
                                                   value="${dto.labour!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="2"></td>
                            </tr>
                            <tr class="signData holiday" id="holidayData" name="节假日客流模拟">
                                <td class="form-tab-label"><label class="form-label"></label></td>
                                <td class="form-tab-label"><label class="form-label">端午</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="dragon" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,999999],messages:{digits: '请输入非负整数且小于999999'}}"
                                                   value="${dto.dragon!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">中秋</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="midAutumn" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,999999],messages:{digits: '请输入非负整数且小于999999'}}"
                                                   value="${dto.midAutumn!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">国庆</label></td>
                                <td>
                                    <div class="form-table-edit">
                                        <div class="daq-inp-rule">
                                            <input type="text" name="national" class="s_input s_input_fb"
                                                   validate="{required:true,digits: true,range:[1,999999],messages:{digits: '请输入非负整数且小于999999'}}"
                                                   value="${dto.national!}"/>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="2"></td>
                                <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div class="sureCheckbox">
                                            <input type="checkbox" class="holidaySure" name="holidaySure" value="1"
                                                   title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="signData traffic" id="trafficData" name="交通预警">
                                <td class="form-tab-label"><label class="form-label">交通预警</label></td>
                                <td class="form-tab-label"><label class="form-label">道路选择</label></td>
                                <td colspan="7">
                                    <div class="form-table-edit">
                                        <div class="choose-box clearfix" id="roadTrafficCheckBox">
                                    <#if roadTraffics??>
                                        <#list roadTraffics as t>
                                            <input type="checkbox" name="roadTraffic" value="${(t.id)!''}"
                                                   title="${(t.name)!''}"
                                                   <#if (dto.roadTraffic)?? && (dto.roadTraffic?split(","))?seq_contains(t.id)>checked</#if>
                                            />
                                        </#list>
                                    </#if>
                                        </div>
                                    </div>
                                </td>
                                <td class="form-tab-label"><label class="form-label">是否模拟</label></td>
                                <td class="checkboxTd">
                                    <div class="form-table-edit">
                                        <div class="sureCheckbox">
                                            <input type="checkbox" class="trafficSure" name="trafficSure"
                                               <#if "1" == (dto.trafficSure)!?string>checked</#if> value="1" title="是"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr id="operateOne" name="operateOne">
                                <td class="dq_dt_ltd" colspan="11">
                                    <div class="form-table-edit">
                                        <input type="button" id="btnSumit" class="daq-btn mr-10"
                                               onclick="lastStep()"
                                               value="上一步"/>
                                        <input type="button" class="daq-btn btn-pad-30 media-btn mt-5 nextorlast"
                                               onclick="saveHtml()" value="保存HTML静态模板"/>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </form>

        </div>

    </div>
</div>
</body>
<#include "../common_coordinate.ftl"><!-- 地图引用 -->
<script>
    $("#roadTrafficCheckBox").daqCheckbox();
    /*模板专用js*/
    //拿到对象
    function nextStep() {
        $("#firstTable").addClass("none");
        $("#secondTable").removeClass('none').find("input").eq(0).focus();
        $(".requireField").hide();
    }

    function lastStep() {
        $("#secondTable").addClass("none");
        $("#firstTable").removeClass("none").find("input").eq(0).focus();
    }
</script>
<script>
    /*这里面的js与 business_data.ftl里面的js一致，页面公共js*/
    $().ready(function () {
        var $weatherRegion = $("#weatherRegion");
        // 地区选择菜单
        $weatherRegion.lSelect({
            url: "/permitted/ajaxRegion",// AJAX数据获取url
            parameter: "region"
        });
        var $windRegion = $("#windRegion");
        // 地区选择菜单
        $windRegion.lSelect({
            url: "/permitted/ajaxRegion",// AJAX数据获取url
            parameter: "region"
        });
    })
    $(".flowSource").daqSelect({
        callback: function (data) {
        }
    });
    $(".kindCheckbox").daqCheckbox({
        type: 1
    });
    // 初始化全选
    if ($(".checkboxAll").attr("checked")) {
        $(".sureCheckbox input").attr("checked", true);
    }
    // 全选反选
    $(".checkboxAll").on("click", function () {
        if ($(this).attr("checked")) {
            $(".sureCheckbox input").attr("checked", true);
        } else {
            $(".sureCheckbox input").removeAttr("checked");
        }
    })
    $(".sureCheckbox input").on("click", function () {
        var notCheckedNum = $(".sureCheckbox input").not("input:checked").length;
        if (notCheckedNum == 0) {
            $(".checkboxAll").attr("checked", true);
        } else {
            $(".checkboxAll").removeAttr("checked");
        }
    })

    var sourceTd = '<div class="form-table-edit">' +
            '<div class="daq-select flowSource">' +
            '<select name="flowSource">' +
            '<option value="">请选择</option>' +
            '<option value="1">官网</option>' +
            '<option value="2">网站</option>' +
            '<option value="3">微博</option>' +
            '<option value="4">微信</option>' +
            '</select>' +
            '</div>' +
            '</div>';
    // 数据时间段插件js
    var start = laydate.render({
        elem: '#startDate',
        type: 'date',
        value: '',
        change: function () {

        },
        done: function (value, date) {
            if (value !== '') {
                end.config.min.year = date.year;
                end.config.min.month = date.month - 1;
                end.config.min.date = date.date;
            } else {
                end.config.min.year = '';
                end.config.min.month = '';
                end.config.min.date = '';
            }
        }
    });
    var end = laydate.render({
        elem: '#endDate',
        type: 'date',
        value: '',
        change: function () {

        },
        done: function (value, date) {
            if (value !== '') {
                start.config.max.year = date.year;
                start.config.max.month = date.month - 1;
                start.config.max.date = date.date;
            } else {
                start.config.max.year = '';
                start.config.max.month = '';
                start.config.max.date = '';
            }
        }
    });

    function saveHtml() {
        //创建数组
        var keyArr = new Array();
        var nameArr = new Array();
        $("table tr[class^='signData']").each(function () {
            var _this = $(this);
            var key = _this.attr("id");
            var nam = _this.attr("name");
            keyArr.push(key);
            nameArr.push(nam)
        });
        //循环table里得tr代码放到数组里
        //ajax请求后台存储
        var _csrf = document.cookie.split("=")[1];
        $.ajax({
            headers: {'X-XSRF-TOKEN': _csrf},
            url: "/htmlTemplet/saveHtmlTempletCode",
            type: "post",
            data: {'keys': keyArr, 'names': nameArr},
            traditional: true,
            dataType: "json",
            success: function (result) {
                layer.alert(result.message)
            }
        });
    }

    var flowTr = '<tr class="signData flow" id="flow" name="">' +
            '<td class="form-tab-label"><label class="form-label"></label></td>' +
            '<td class="form-tab-label"><label class="form-label">类型:</label></td>' +
            '<td id="sourceTd">' +
            '<div class="form-table-edit">' +
            '<div class="daq-select flowSource">' +
            '<select name="flowSource">' +
            '<option value="">请选择</option>' +
            '<option value="1">官网</option>' +
            '<option value="2">网站</option>' +
            '<option value="3">微博</option>' +
            '<option value="4">微信</option>' +
            '</select>' +
            '</div>' +
            '</div>' +
            '</td>' +
            '<td class="form-tab-label"><label class="form-label">每小时访问量最小值:</label></td>' +
            '<td>' +
            '<div class="form-table-edit">' +
            '<div class="daq-inp-rule">' +
            '<input type="text" name="flowHourMin" class="s_input s_input_fb" validate="{required:true,digits: true,range:[1,10],messages:{digits: \'请输入非负整数且小于10\'}}" value=""/>' +
            '</div>' +
            '</div>' +
            '</td>' +
            '<td class="form-tab-label"><label class="form-label">每小时访问量最大值:</label></td>' +
            '<td>' +
            '<div class="form-table-edit">' +
            '<div class="daq-inp-rule">' +
            '<input type="text" name="flowHourMax" class="s_input s_input_fb" validate="{required:true,digits: true,range:[1,9999],messages:{digits: \'请输入非负整数\'}}" value=""/>' +
            '</div>' +
            '</div>' +
            '</td>' +
            '<td class="form-tab-label"><label class="form-label">新增流量统计</label></td>' +
            '<td>' +
            '<div class="demo-button">' +
            '<div class="daq-btn-line btn-icon add"><i class="sysfont"></i></div> ' +
            ' <div class="daq-btn-line btn-icon remove"><i class="sysfont"></i></div>' +
            '</div>' +
            '</td>' +
            '<td class="form-tab-label"><label class="form-label">是否模拟:</label></td>' +
            '<td class="checkboxTd">' +
            '<div class="form-table-edit">' +
            '<div class="sureCheckbox">' +
            '<input type="checkbox" name="flowHourSure" checked value="1" title="是" />' +
            '</div>' +
            '</div>' +
            '</td>' +
            '</tr>';
    // copy DOM
    $(document).on("click", '.add', function () {
        // 限制个数
        var trs = $("#table .flow").length;
        if (trs >= 4) {
            layer.alert("最多4个节点");
            return;
        }
        $(".flow:last").after(flowTr);
        // 绑定事件
        $(".flowSource:last").daqSelect({
            callback: function (data) {
            }
        });
    });
    $(document).on("click", '.remove', function () {
        // 判断是否是最后一个
        var trs = $("#table .flow").length;
        if (trs <= 1) {
            layer.alert("已经是最后一个节点，不能删除");
            return;
        }
        $(this).closest('.flow').remove();
    });
</script>
<script>
    /*页面所有大小值判断验证的js*/
    // 只有一对最小最大值的验证
    $.validator.addMethod("checkMinMax", function (value, element, params) {
        var randomMax = $(element).closest('.signData').find("input[name$='Max']").val();
        if (randomMax !== null && randomMax !== "" && randomMax !== undefined) {
            return this.optional(element) || (parseInt(randomMax) >= parseInt(value));
        }
        return true;
    }, "小于最大值");
    // 游客画像验证
    $.validator.addMethod("checkManRatioMin", function (value, element, params) {
        var randomMax = $(element).closest('.signData').find("input[name='manRatioMax']").val();
        if (randomMax !== null && randomMax !== "" && randomMax !== undefined) {
            return this.optional(element) || (parseInt(randomMax) >= parseInt(value));
        }
        return true;
    }, "小于最大值");
    $.validator.addMethod("checkPortrayalAmountMin", function (value, element, params) {
        var randomMax = $(element).closest('.signData').find("input[name='portrayalAmountMax']").val();
        if (randomMax !== null && randomMax !== "" && randomMax !== undefined) {
            return this.optional(element) || (parseInt(randomMax) >= parseInt(value));
        }
        return true;
    }, "小于最大值");
    // 景区日客流趋势分析
    $.validator.addMethod("checkEnterMin", function (value, element, params) {
        var randomMax = $(element).closest('.signData').find("input[name='enterMax']").val();
        if (randomMax !== null && randomMax !== "" && randomMax !== undefined) {
            return this.optional(element) || (parseInt(randomMax) >= parseInt(value));
        }
        return true;
    }, "小于最大值");
    $.validator.addMethod("checkLeaveMin", function (value, element, params) {
        var randomMax = $(element).closest('.signData').find("input[name='leaveMax']").val();
        if (randomMax !== null && randomMax !== "" && randomMax !== undefined) {
            return this.optional(element) || (parseInt(randomMax) >= parseInt(value));
        }
        return true;
    }, "小于最大值");
    // 未来6天票务预测预警
    $.validator.addMethod("checkOnlineMin", function (value, element, params) {
        var randomMax = $(element).closest('.signData').find("input[name='onlineMax']").val();
        if (randomMax !== null && randomMax !== "" && randomMax !== undefined) {
            return this.optional(element) || (parseInt(randomMax) >= parseInt(value));
        }
        return true;
    }, "小于最大值");
    $.validator.addMethod("checkOfflineMin", function (value, element, params) {
        var randomMax = $(element).closest('.signData').find("input[name='offlineMax']").val();
        if (randomMax !== null && randomMax !== "" && randomMax !== undefined) {
            return this.optional(element) || (parseInt(randomMax) >= parseInt(value));
        }
        return true;
    }, "小于最大值");
</script>
</html>