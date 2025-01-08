module "key_bastion1" {
    source = "./modules/keys"
    key_name = "key_bastion1"
}

module "key_bastion2" {
    source = "./modules/keys"
    key_name = "key_bastion2"
}

module "key_application1" {
    source = "./modules/keys"
    key_name = "key_application1"
}

module "key_application2" {
    source = "./modules/keys"
    key_name = "key_application2"
}