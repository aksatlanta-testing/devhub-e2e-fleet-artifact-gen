
{{- define "go-echob12b099e-ad59-479d-b55b-ffb673bbbbeb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob12b099e-ad59-479d-b55b-ffb673bbbbeb.fullname" -}}
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


{{- define "go-echob12b099e-ad59-479d-b55b-ffb673bbbbeb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob12b099e-ad59-479d-b55b-ffb673bbbbeb.labels" -}}
helm.sh/chart: {{ include "go-echob12b099e-ad59-479d-b55b-ffb673bbbbeb.chart" . }}
{{ include "go-echob12b099e-ad59-479d-b55b-ffb673bbbbeb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob12b099e-ad59-479d-b55b-ffb673bbbbeb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob12b099e-ad59-479d-b55b-ffb673bbbbeb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}