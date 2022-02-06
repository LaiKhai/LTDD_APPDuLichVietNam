@extends('layouts.app')
@section('title')
Danh sách thông tin món ăn
@endsection
@section('content-wrapper')
@parent
<div class="col-md-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h2 class="card-title">
                Chi tiết món ăn
            </h2>
            <form class="forms-sample">
                <div class="form-group row">
                    <label for="exampleInputUsername2" class="col-sm-3 col-form-label">ID</label>
                    <div class="col-sm-9">
                        <p>{{$monan->id}}</p>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Tên món ăn</label>
                    <div class="col-sm-9">
                        <p>{{$monan->ten}}</p>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputMobile" class="col-sm-3 col-form-label">Mô tả</label>
                    <div class="col-sm-9">
                        {{$monan->mota}}
                    </div>
                </div>

                <div class="form-group row">
                    <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Thuộc địa danh</label>
                    <div class="col-sm-9">
                        @foreach ($diadanh as $item)
                        <p>{{$item->tendiadanh}}</p>
                        @endforeach
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Trạng thái</label>
                    <div class="col-sm-9">
                        @if ($monan->trangthai==1)
                        <span class="badge bg-success text-white">Tồn tại</span>
                        @endif
                        @if ($monan->trangthai==0)
                        <span class="badge bg-danger text-white">Đã xóa</span>
                        @endif
                        @if ($monan->trangthai==2)
                        <span class="badge bg-warining text-white">Đang xử lí</span>
                        @endif
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Hình Ảnh</label>
                    <div class="col-sm-9">
                        <img src="{{$monan->hinhanh}}" style="width:3d00px; max-height:200px;object-fit:contain;"
                            alt="">
                    </div>
                </div>
                <a type="button" class="btn btn-outline-primary" href="{{route('monan.index')}}">Quay lại</a>
            </form>
        </div>
    </div>
</div>
@endsection