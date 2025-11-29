
{{- define "go-echob8f3eb0a-5f6a-4804-8679-758e2ada30b7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob8f3eb0a-5f6a-4804-8679-758e2ada30b7.fullname" -}}
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


{{- define "go-echob8f3eb0a-5f6a-4804-8679-758e2ada30b7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob8f3eb0a-5f6a-4804-8679-758e2ada30b7.labels" -}}
helm.sh/chart: {{ include "go-echob8f3eb0a-5f6a-4804-8679-758e2ada30b7.chart" . }}
{{ include "go-echob8f3eb0a-5f6a-4804-8679-758e2ada30b7.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob8f3eb0a-5f6a-4804-8679-758e2ada30b7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob8f3eb0a-5f6a-4804-8679-758e2ada30b7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}