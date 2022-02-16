@extends('layouts.app')
@section('title')
Chi tiết bài viết
@endsection
@section('content-wrapper')
@parent
<div class="col-md-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">@yield('title')</h4>
            <div class="form-group row">
                <label for="exampleInputUsername2" class="col-sm-3 col-form-label">ID</label>
                <div class="col-sm-9">
                    <p class="text-black">
                        {{$baiviet->id}}
                    </p>
                </div>
            </div>
            <div class="form-group row">
                <label for="exampleInputUsername2" class="col-sm-3 col-form-label">Tiêu đề</label>
                <div class="col-sm-9">
                    <p class="text-black">
                        {{$baiviet->tieude}}
                    </p>
                </div>
            </div>
            <div class="form-group row">
                <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Mô tả</label>
                <div class="col-sm-9">
                    <p class="text-black">
                        {{$baiviet->mota}}
                    </p>
                </div>
            </div>
            <div class="form-group row">
                <label for="exampleInputMobile" class="col-sm-3 col-form-label">Thuộc địa danh</label>
                <div class="col-sm-9">
                    <p class="text-black">{{$diaDanh['tendiadanh']}}</p>
                </div>
            </div>
            <div class="form-group row">
                <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Tài khoản</label>
                <div class="col-sm-9">
                    <p class="text-black">
                        {{$User['email']}}
                    </p>
                </div>
            </div>

            <div class="form-group row">
                <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Trạng thái</label>
                <div class="col-sm-9">
                    @if ($baiviet->trangthai==1)
                    <span class="badge bg-success text-white">Tồn tại</span>
                    @endif
                    @if ($baiviet->trangthai==0)
                    <span class="badge bg-danger text-white">Đã xóa</span>
                    @endif
                    @if ($baiviet->trangthai==2)
                    <span class="badge bg-warining text-white">Đang xử lí</span>
                    @endif
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-12">
                    @foreach ($lstHinhAnh as $item)
                    <img src="{{$item->hinhanh}}" style="width:3d00px; max-height:200px;object-fit:contain;" alt="">
                    @endforeach
                </div>
            </div>
            <a type="button" class="btn btn-outline-primary" href="{{route('diadanh.index')}}">Quay lại</a>
        </div>
    </div>
</div>
@endsection