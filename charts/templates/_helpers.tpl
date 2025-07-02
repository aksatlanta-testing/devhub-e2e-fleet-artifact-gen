
{{- define "go-echo0729ba19-93f6-4da1-ad9d-d9b707c16510.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0729ba19-93f6-4da1-ad9d-d9b707c16510.fullname" -}}
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


{{- define "go-echo0729ba19-93f6-4da1-ad9d-d9b707c16510.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0729ba19-93f6-4da1-ad9d-d9b707c16510.labels" -}}
helm.sh/chart: {{ include "go-echo0729ba19-93f6-4da1-ad9d-d9b707c16510.chart" . }}
{{ include "go-echo0729ba19-93f6-4da1-ad9d-d9b707c16510.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0729ba19-93f6-4da1-ad9d-d9b707c16510.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0729ba19-93f6-4da1-ad9d-d9b707c16510.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}