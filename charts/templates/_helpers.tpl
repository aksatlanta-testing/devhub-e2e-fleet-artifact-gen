
{{- define "go-echoe4acfb5a-3291-4020-9b85-1cd216a6a8fe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe4acfb5a-3291-4020-9b85-1cd216a6a8fe.fullname" -}}
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


{{- define "go-echoe4acfb5a-3291-4020-9b85-1cd216a6a8fe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe4acfb5a-3291-4020-9b85-1cd216a6a8fe.labels" -}}
helm.sh/chart: {{ include "go-echoe4acfb5a-3291-4020-9b85-1cd216a6a8fe.chart" . }}
{{ include "go-echoe4acfb5a-3291-4020-9b85-1cd216a6a8fe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe4acfb5a-3291-4020-9b85-1cd216a6a8fe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe4acfb5a-3291-4020-9b85-1cd216a6a8fe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}