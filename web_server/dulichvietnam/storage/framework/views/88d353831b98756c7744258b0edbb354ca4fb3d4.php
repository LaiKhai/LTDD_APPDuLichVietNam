
<?php $__env->startSection('title'); ?>
Danh sách thông tin món ăn
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content-wrapper'); ?>
<?php echo \Illuminate\View\Factory::parentPlaceholder('content-wrapper'); ?>
<div class="page-header">
    <h3 class="page-title"><?php echo $__env->yieldContent('title'); ?></h3>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Dashboar</a></li>
            <li class="breadcrumb-item active" aria-current="page">Thông tin món ăn</li>
        </ol>
    </nav>
</div>
<div class="row">
    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Thông tin món ăn</h4>
                </p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th> ID </th>
                            <th> Hình Ảnh </th>
                            <th> Tên món </th>
                            <th> Mô tả </th>
                            <th> Trạng thái </th>
                            <th> Chức năng </th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $__currentLoopData = $MonAn; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $monan): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <tr>
                            <td><?php echo e($monan->id); ?></td>
                            <td class="py-1">
                                <img src="admin_view/assets/images/monan/pic<?php echo e($monan->id); ?>.jpg" alt="image" />
                            </td>
                            <td><?php echo e($monan->ten); ?></td>
                            <td>
                                <div style="width: 300px;
                                    white-space: normal;"><?php echo e($monan->mota); ?></div>
                            </td>
                            <td>
                                <?php if($monan->trangthai==1): ?>
                                <span class="badge bg-success">Tồn tại</span>
                                <?php endif; ?>
                                <?php if($monan->trangthai==0): ?>
                                <span class="badge bg-danger">Đã xóa</span>
                                <?php endif; ?>
                                <?php if($monan->trangthai==2): ?>
                                <span class="badge bg-warining">Đang xử lí</span>
                                <?php endif; ?>
                            </td>
                            <td>
                                <button type="button" class="btn btn-outline-success">Sửa</button>
                                <button type="button" class="btn btn-outline-danger">Xóa</button>
                            </td>
                        </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\HocTap\HKIV\Android_flutter\DO_AN_MON_HOC\LTDD_APPDuLichVietNam\web_server\dulichvietnam\resources\views/monan.blade.php ENDPATH**/ ?>