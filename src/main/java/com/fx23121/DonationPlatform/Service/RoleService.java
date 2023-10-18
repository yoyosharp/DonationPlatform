package com.fx23121.DonationPlatform.Service;

import com.fx23121.DonationPlatform.Entity.Role;

import java.util.List;

public interface RoleService {
    Role getRole(int roleId);

    List<Role> getRoles();
}
