
{{- define "go-echo07cc0406-8d8c-4b88-afaa-0e2ef8721bef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo07cc0406-8d8c-4b88-afaa-0e2ef8721bef.fullname" -}}
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


{{- define "go-echo07cc0406-8d8c-4b88-afaa-0e2ef8721bef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo07cc0406-8d8c-4b88-afaa-0e2ef8721bef.labels" -}}
helm.sh/chart: {{ include "go-echo07cc0406-8d8c-4b88-afaa-0e2ef8721bef.chart" . }}
{{ include "go-echo07cc0406-8d8c-4b88-afaa-0e2ef8721bef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo07cc0406-8d8c-4b88-afaa-0e2ef8721bef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo07cc0406-8d8c-4b88-afaa-0e2ef8721bef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}