package com.fx23121.DonationPlatform.DAO;

import com.fx23121.DonationPlatform.Entity.Role;

import java.util.List;

public interface RoleDAO {
    Role getRole(int roleId);

    List<Role> getRoles();
}
