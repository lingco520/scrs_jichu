/**
 * @Copyright: <a htef="http://www.daqsoft.com
 * <p>
 * ">成都中科大旗软件有限公司Copyright  2004-2017蜀ICP备08010315号</a>
 * @Warning: 注意：本内容仅限于成都中科大旗软件有限公司内部传阅，禁止外泄以及用于其他的商业目的。
 */
package com.daqsoft.service.touristComodity;

import com.daqsoft.entity.touristCommodity.ResTouristCommodity;
import com.daqsoft.form.PageForm;
import com.daqsoft.mapper.resource.ResTouristCommodityMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Title: TouristComodityService
 * @Author: tanggm
 * @Date: 2018/01/09 17:00
 * @Description: TODO 基础资源-旅游商品
 * @Comment：
 * @see
 * @Version:
 * @since JDK 1.8
 * @Warning:
 */
@Transactional
@Service
public class TouristComodityService {

    @Autowired
    private ResTouristCommodityMapper resTouristCommodityMapper;

    /**
     * 列表
     * @param pageForm
     * @param name
     * @return
     * @throws Exception
     */
    public PageForm list(PageForm pageForm, String name, Integer status) throws Exception{
        Page page = PageHelper.startPage(pageForm.getCurrPage(), pageForm.getPageSize(), true);
        List<ResTouristCommodity> list = resTouristCommodityMapper.selectList(name, status, pageForm.getVcode());
        pageForm.setRows(list);
        pageForm.setTotalCount(page.getTotal());
        return pageForm;
    }

    /**
     * 详情
     * @param id
     * @return
     * @throws Exception
     */
    public ResTouristCommodity get(Long id) throws Exception{
        return resTouristCommodityMapper.selectByPrimaryKey(id);
    }

    /**
     * 保存
     * @param dto
     * @throws Exception
     */
    public void save(ResTouristCommodity dto) throws Exception{
        resTouristCommodityMapper.insert(dto);
    }

    /**
     * 更新数据
     * @param dto
     * @throws Exception
     */
    public void update(ResTouristCommodity dto) throws Exception{
        resTouristCommodityMapper.updateByPrimaryKey(dto);
    }

    /**
     * 删除
     * @param ids
     * @throws Exception
     */
    public void delete(Long[] ids) throws Exception{
        for (Long id : ids){
            resTouristCommodityMapper.deleteByPrimaryKey(id);
        }
    }
}
