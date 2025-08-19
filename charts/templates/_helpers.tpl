
{{- define "go-echodba924f8-4b8a-4803-96d2-3dce5752e3dc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodba924f8-4b8a-4803-96d2-3dce5752e3dc.fullname" -}}
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


{{- define "go-echodba924f8-4b8a-4803-96d2-3dce5752e3dc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodba924f8-4b8a-4803-96d2-3dce5752e3dc.labels" -}}
helm.sh/chart: {{ include "go-echodba924f8-4b8a-4803-96d2-3dce5752e3dc.chart" . }}
{{ include "go-echodba924f8-4b8a-4803-96d2-3dce5752e3dc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodba924f8-4b8a-4803-96d2-3dce5752e3dc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodba924f8-4b8a-4803-96d2-3dce5752e3dc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}