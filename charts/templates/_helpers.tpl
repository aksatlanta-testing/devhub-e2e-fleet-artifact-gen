
{{- define "go-echo637dc100-e5de-4548-9f59-c9c8d7b59aef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo637dc100-e5de-4548-9f59-c9c8d7b59aef.fullname" -}}
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


{{- define "go-echo637dc100-e5de-4548-9f59-c9c8d7b59aef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo637dc100-e5de-4548-9f59-c9c8d7b59aef.labels" -}}
helm.sh/chart: {{ include "go-echo637dc100-e5de-4548-9f59-c9c8d7b59aef.chart" . }}
{{ include "go-echo637dc100-e5de-4548-9f59-c9c8d7b59aef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo637dc100-e5de-4548-9f59-c9c8d7b59aef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo637dc100-e5de-4548-9f59-c9c8d7b59aef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}