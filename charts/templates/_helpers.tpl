
{{- define "go-echob1b197bd-3dbc-4bb6-b283-14177a3ef75b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob1b197bd-3dbc-4bb6-b283-14177a3ef75b.fullname" -}}
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


{{- define "go-echob1b197bd-3dbc-4bb6-b283-14177a3ef75b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob1b197bd-3dbc-4bb6-b283-14177a3ef75b.labels" -}}
helm.sh/chart: {{ include "go-echob1b197bd-3dbc-4bb6-b283-14177a3ef75b.chart" . }}
{{ include "go-echob1b197bd-3dbc-4bb6-b283-14177a3ef75b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob1b197bd-3dbc-4bb6-b283-14177a3ef75b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob1b197bd-3dbc-4bb6-b283-14177a3ef75b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}