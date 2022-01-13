@extends('layouts.app')
@section('title')
Danh sách thông tin món ăn
@endsection
@section('content-wrapper')
@parent
<div class="page-header">
    <h3 class="page-title">@yield('title')</h3>
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
                        @foreach ($data as $item)
                        <tr>
                            <td>{{$item['id']}}</td>
                            <td class="py-1">
                                <img src="admin_view/assets/images/monan/pic{{$item['id']}}.jpg" alt="image" />
                            </td>
                            <td>{{$item['ten']}}</td>
                            <td>
                                <div style="width: 300px;
                                    white-space: normal;">{{$item['mota']}}</div>
                            </td>
                            <td>
                                @if ($item['trangthai']==1)
                                <span class="badge bg-success">Tồn tại</span>
                                @endif
                                @if ($item['trangthai']==0)
                                <span class="badge bg-danger">Đã xóa</span>
                                @endif
                                @if ($item['trangthai']==2)
                                <span class="badge bg-warining">Đang xử lí</span>
                                @endif
                            </td>
                            <td>
                                <button type="button" class="btn btn-outline-success">Sửa</button>
                                <button type="button" class="btn btn-outline-danger">Xóa</button>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection