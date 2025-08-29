
{{- define "go-echo626c1e3d-4af7-4ca6-943e-580b19ba96bb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo626c1e3d-4af7-4ca6-943e-580b19ba96bb.fullname" -}}
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


{{- define "go-echo626c1e3d-4af7-4ca6-943e-580b19ba96bb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo626c1e3d-4af7-4ca6-943e-580b19ba96bb.labels" -}}
helm.sh/chart: {{ include "go-echo626c1e3d-4af7-4ca6-943e-580b19ba96bb.chart" . }}
{{ include "go-echo626c1e3d-4af7-4ca6-943e-580b19ba96bb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo626c1e3d-4af7-4ca6-943e-580b19ba96bb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo626c1e3d-4af7-4ca6-943e-580b19ba96bb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}