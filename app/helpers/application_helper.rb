module ApplicationHelper
  def app_name
    title=<<EOF
    BHT billing system
EOF

  end

  def organization_name
    'Daeyang Luke International Hospital'
  end

  def admin?
    unless User.current.blank?
      User.current.user_role.role.role.include?('Administrator') 
    end
  end

end
