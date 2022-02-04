@extends('layouts.app')
@section('title')
Danh sách thông tin món ăn
@endsection
@section('content-wrapper')
@parent
<div class="col-md-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Chi tiết địa danh</h4>
            <div class="form-group row">
                @foreach ($lstdiadanh as $item)
                <label for="exampleInputUsername2" class="col-sm-3 col-form-label">ID</label>
                <div class="col-sm-9">
                    <p class="text-black">
                        {{$item->id}}
                    </p>
                </div>
            </div>
            <div class="form-group row">
                <label for="exampleInputUsername2" class="col-sm-3 col-form-label">Tên địa danh</label>
                <div class="col-sm-9">
                    <p class="text-black">
                        {{$item->tendiadanh}}
                    </p>
                </div>
            </div>
            <div class="form-group row">
                <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Mô tả</label>
                <div class="col-sm-9">
                    <p class="text-black">
                        {{$item->mota}}
                    </p>
                </div>
            </div>
            <div class="form-group row">
                <label for="exampleInputMobile" class="col-sm-3 col-form-label">Tên vùng miền</label>
                <div class="col-sm-9">
                    <p class="text-black">{{$item->tenvungmien}}</p>
                </div>
            </div>
            <div class="form-group row">
                <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Kinh độ</label>
                <div class="col-sm-9">
                    <p class="text-black">
                        {{$item->kinhdo}}
                    </p>
                </div>
            </div>
            <div class="form-group row">
                <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Vĩ độ</label>
                <div class="col-sm-9">
                    <p class="text-black">
                        {{$item->vido}}
                    </p>
                </div>
            </div>
            <div class="form-group row">
                <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Trạng thái</label>
                <div class="col-sm-9">
                    @if ($item->trangthai==1)
                    <span class="badge bg-success text-white">Tồn tại</span>
                    @endif
                    @if ($item->trangthai==0)
                    <span class="badge bg-danger text-white">Đã xóa</span>
                    @endif
                    @if ($item->trangthai==2)
                    <span class="badge bg-warining text-white">Đang xử lí</span>
                    @endif
                </div>
            </div>
            @endforeach
            <a type="button" class="btn btn-outline-primary" href="{{route('diadanh.index')}}">Quay lại</a>
        </div>
    </div>
</div>
@endsection