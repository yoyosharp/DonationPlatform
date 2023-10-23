package com.fx23121.DonationPlatform.Service;

import com.fx23121.DonationPlatform.DAO.RoleDAO;
import com.fx23121.DonationPlatform.Entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDAO roleDAO;

    @Override
    @Transactional
    public Role getRole(int roleId) {
        return roleDAO.getRole(roleId);
    }

    @Override
    @Transactional
    public List<Role> getRoles() {
        return roleDAO.getRoles();
    }
}
