
{{- define "go-echo2489db05-cfa1-4384-a77b-bc4c8995b22b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2489db05-cfa1-4384-a77b-bc4c8995b22b.fullname" -}}
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


{{- define "go-echo2489db05-cfa1-4384-a77b-bc4c8995b22b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2489db05-cfa1-4384-a77b-bc4c8995b22b.labels" -}}
helm.sh/chart: {{ include "go-echo2489db05-cfa1-4384-a77b-bc4c8995b22b.chart" . }}
{{ include "go-echo2489db05-cfa1-4384-a77b-bc4c8995b22b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2489db05-cfa1-4384-a77b-bc4c8995b22b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2489db05-cfa1-4384-a77b-bc4c8995b22b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}