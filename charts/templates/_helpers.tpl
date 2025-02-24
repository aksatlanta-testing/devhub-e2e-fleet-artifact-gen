
{{- define "go-echo903ad9c7-25a0-4661-8ba9-f023b3689bef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo903ad9c7-25a0-4661-8ba9-f023b3689bef.fullname" -}}
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


{{- define "go-echo903ad9c7-25a0-4661-8ba9-f023b3689bef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo903ad9c7-25a0-4661-8ba9-f023b3689bef.labels" -}}
helm.sh/chart: {{ include "go-echo903ad9c7-25a0-4661-8ba9-f023b3689bef.chart" . }}
{{ include "go-echo903ad9c7-25a0-4661-8ba9-f023b3689bef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo903ad9c7-25a0-4661-8ba9-f023b3689bef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo903ad9c7-25a0-4661-8ba9-f023b3689bef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}