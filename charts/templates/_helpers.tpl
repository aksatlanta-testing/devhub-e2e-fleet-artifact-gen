
{{- define "go-echod5ac2c91-992f-4c56-9bf0-7fd1e961d57e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5ac2c91-992f-4c56-9bf0-7fd1e961d57e.fullname" -}}
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


{{- define "go-echod5ac2c91-992f-4c56-9bf0-7fd1e961d57e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5ac2c91-992f-4c56-9bf0-7fd1e961d57e.labels" -}}
helm.sh/chart: {{ include "go-echod5ac2c91-992f-4c56-9bf0-7fd1e961d57e.chart" . }}
{{ include "go-echod5ac2c91-992f-4c56-9bf0-7fd1e961d57e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod5ac2c91-992f-4c56-9bf0-7fd1e961d57e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod5ac2c91-992f-4c56-9bf0-7fd1e961d57e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}