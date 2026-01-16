
{{- define "go-echo0441b498-24a4-440b-89d3-32ccb741ff8e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0441b498-24a4-440b-89d3-32ccb741ff8e.fullname" -}}
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


{{- define "go-echo0441b498-24a4-440b-89d3-32ccb741ff8e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0441b498-24a4-440b-89d3-32ccb741ff8e.labels" -}}
helm.sh/chart: {{ include "go-echo0441b498-24a4-440b-89d3-32ccb741ff8e.chart" . }}
{{ include "go-echo0441b498-24a4-440b-89d3-32ccb741ff8e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0441b498-24a4-440b-89d3-32ccb741ff8e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0441b498-24a4-440b-89d3-32ccb741ff8e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}