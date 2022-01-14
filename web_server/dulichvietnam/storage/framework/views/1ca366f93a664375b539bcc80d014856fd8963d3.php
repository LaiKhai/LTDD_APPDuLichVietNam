
<?php $__env->startSection('title'); ?>
Danh sách thông tin người dùng
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content-wrapper'); ?>
<?php echo \Illuminate\View\Factory::parentPlaceholder('content-wrapper'); ?>
<div class="page-header">
    <h3 class="page-title"><?php echo $__env->yieldContent('title'); ?></h3>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Dashboar</a></li>
            <li class="breadcrumb-item active" aria-current="page">Thông tin người dùng</li>
        </ol>
    </nav>
</div>
<div class="row">
    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Thông tin người dùng</h4>
                </p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th> ID </th>
                            <th> Hình Ảnh </th>
                            <th> Họ Tên </th>
                            <th> Email </th>
                            <th> SĐT </th>
                            <th> Phân quyền </th>
                            <th> Trạng thái </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td class="py-1">
                                <img src="admin_view/assets/images/faces-clipart/pic1.jpg" alt="image" />
                            </td>
                            <td>Lai Khải</td>
                            <td>
                                Laihongkhai5@gmail.com
                            </td>
                            <td>0703756400</td>
                            <td>User</td>
                            <td><span class="badge bg-success">Tồn tại</span></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td class="py-1">
                                <img src="admin_view/assets/images/faces-clipart/pic2.jpg" alt="image" />
                            </td>
                            <td>Lai Khải 2</td>
                            <td>
                                Laihongkhai6@gmail.com
                            </td>
                            <td>0703756400</td>
                            <td>User</td>
                            <td><span class="badge bg-danger">Đã xóa</span></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td class="py-1">
                                <img src="admin_view/assets/images/faces-clipart/pic3.jpg" alt="image" />
                            </td>
                            <td>Lai Khải 3</td>
                            <td>
                                Laihongkhai7@gmail.com
                            </td>
                            <td>0703756400</td>
                            <td>User</td>
                            <td><span class="badge bg-warning">tạm khóa</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\HocTap\HKIV\Android_flutter\DO_AN_MON_HOC\LTDD_APPDuLichVietNam\web_server\dulichvietnam\resources\views/home.blade.php ENDPATH**/ ?>