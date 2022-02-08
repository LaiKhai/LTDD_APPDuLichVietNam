@extends('layouts.app')
@section('title')
Danh sách thông tin lưu trú
@endsection
@section('content-wrapper')
@parent
<div class="col-md-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h2 class="card-title">
                Chi tiết nơi lưu trú
            </h2>
            <form class="forms-sample">
                <div class="form-group row">
                    <label for="exampleInputUsername2" class="col-sm-3 col-form-label">ID</label>
                    <div class="col-sm-9">
                        <p>{{$luutru->id}}</p>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Tên món ăn</label>
                    <div class="col-sm-9">
                        <p>{{$luutru->ten}}</p>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputMobile" class="col-sm-3 col-form-label">Địa chỉ</label>
                    <div class="col-sm-9">
                        {{$luutru->diachi}}
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputMobile" class="col-sm-3 col-form-label">SĐT</label>
                    <div class="col-sm-9">
                        {{$luutru->sdt}}
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Thuộc địa danh</label>
                    <div class="col-sm-9">
                        @foreach ($diaDanh as $item)
                        <p>{{$item->tendiadanh}}</p>
                        @endforeach
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Trạng thái</label>
                    <div class="col-sm-9">
                        @if ($luutru->trangthai==1)
                        <span class="badge bg-success text-white">Tồn tại</span>
                        @endif
                        @if ($luutru->trangthai==0)
                        <span class="badge bg-danger text-white">Đã xóa</span>
                        @endif
                        @if ($luutru->trangthai==2)
                        <span class="badge bg-warining text-white">Đang xử lí</span>
                        @endif
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Hình Ảnh</label>
                    <div class="col-sm-9">
                        <img src="{{$luutru->hinhanh}}" style="width:3d00px; max-height:200px;object-fit:contain;"
                            alt="">
                    </div>
                </div>
                <a type="button" class="btn btn-outline-primary" href="{{route('luutru.index')}}">Quay lại</a>
            </form>
        </div>
    </div>
</div>
@endsection