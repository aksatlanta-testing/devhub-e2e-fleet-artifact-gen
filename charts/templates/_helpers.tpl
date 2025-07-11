
{{- define "go-echo7005790a-5d06-4c53-ba6e-15ff007b8343.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7005790a-5d06-4c53-ba6e-15ff007b8343.fullname" -}}
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


{{- define "go-echo7005790a-5d06-4c53-ba6e-15ff007b8343.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7005790a-5d06-4c53-ba6e-15ff007b8343.labels" -}}
helm.sh/chart: {{ include "go-echo7005790a-5d06-4c53-ba6e-15ff007b8343.chart" . }}
{{ include "go-echo7005790a-5d06-4c53-ba6e-15ff007b8343.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7005790a-5d06-4c53-ba6e-15ff007b8343.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7005790a-5d06-4c53-ba6e-15ff007b8343.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}