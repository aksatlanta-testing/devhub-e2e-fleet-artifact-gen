
{{- define "go-echof93eba45-e391-4fa0-8b55-e1e6c9a4888a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof93eba45-e391-4fa0-8b55-e1e6c9a4888a.fullname" -}}
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


{{- define "go-echof93eba45-e391-4fa0-8b55-e1e6c9a4888a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof93eba45-e391-4fa0-8b55-e1e6c9a4888a.labels" -}}
helm.sh/chart: {{ include "go-echof93eba45-e391-4fa0-8b55-e1e6c9a4888a.chart" . }}
{{ include "go-echof93eba45-e391-4fa0-8b55-e1e6c9a4888a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof93eba45-e391-4fa0-8b55-e1e6c9a4888a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof93eba45-e391-4fa0-8b55-e1e6c9a4888a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}