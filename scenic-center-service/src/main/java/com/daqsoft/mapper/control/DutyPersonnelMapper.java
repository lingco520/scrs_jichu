package com.daqsoft.mapper.control;


import com.daqsoft.entity.department.SysDepartment;
import com.daqsoft.entity.dutypersonnel.SysDutypersonnel;
import com.daqsoft.mapper.common.BaseCommonMapper;
import com.daqsoft.vo.SysDictVo;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Title: 信息发布渠道配置
 * @Author: superziy .
 * @Date: Created in 10:10 2018/1/10.
 * @Version: 4.0.0
 * @describe:信息发布渠道配置
 * @since:JDK 1.8
 */
@Repository
public interface DutyPersonnelMapper extends BaseCommonMapper<SysDutypersonnel>{

    /**
     * 查询列表数据
     *
     * @param map
     * @return
     */
    List<SysDutypersonnel> selectList(Map map);

}