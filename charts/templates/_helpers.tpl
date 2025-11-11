
{{- define "go-echocfb36443-bd31-4036-ae3c-3ec4309b0d16.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfb36443-bd31-4036-ae3c-3ec4309b0d16.fullname" -}}
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


{{- define "go-echocfb36443-bd31-4036-ae3c-3ec4309b0d16.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfb36443-bd31-4036-ae3c-3ec4309b0d16.labels" -}}
helm.sh/chart: {{ include "go-echocfb36443-bd31-4036-ae3c-3ec4309b0d16.chart" . }}
{{ include "go-echocfb36443-bd31-4036-ae3c-3ec4309b0d16.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocfb36443-bd31-4036-ae3c-3ec4309b0d16.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocfb36443-bd31-4036-ae3c-3ec4309b0d16.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}