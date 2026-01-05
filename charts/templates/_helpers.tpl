
{{- define "go-echo1683789c-1058-430a-bd82-cb5120b8c97d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1683789c-1058-430a-bd82-cb5120b8c97d.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo1683789c-1058-430a-bd82-cb5120b8c97d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1683789c-1058-430a-bd82-cb5120b8c97d.labels" -}}
helm.sh/chart: {{ include "go-echo1683789c-1058-430a-bd82-cb5120b8c97d.chart" . }}
{{ include "go-echo1683789c-1058-430a-bd82-cb5120b8c97d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1683789c-1058-430a-bd82-cb5120b8c97d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1683789c-1058-430a-bd82-cb5120b8c97d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}